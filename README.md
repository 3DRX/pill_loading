# 基于 Xilinx FPGA 的药片装瓶系统

> 康京旸 - 322 - 2021210943
>
> https://github.com/3DRX/pill_loading

## 开发环境

- Ubuntu 22.04 LTS
- Vivado v2022.2 (64-bit)
- GHDL 1.0.0 (Ubuntu 1.0.0+dfsg-6) [Dunoon edition]
- GTKWave
- Minisys 开发板，搭载 Xilinx Artix-7（XC7A100T FGG484C-1）

## 设计内容

### 功能概述

有两个模式，设置初始值模式与计数模式。

在设置初始值模式下，接受键盘输入分别设定每瓶药片数和总瓶数。
其中药片数最大值为 50，瓶数最大为 18。
如果用户的输入超过了最大值，则按照最大值处理。

在计数模式下，以 `0.5Hz` 的频率增加计数器，模拟药片的装入过程。
当前累积装载药片超过设定的总数时，停止装载药片并播放提示音。

有两个指示灯：红灯在设置初始值模式下亮，绿灯在计数模式下亮。

### 结合开发板硬件资源的实现

利用的开发板资源如下：
- XC7A100T FGG484C-1 芯片
- `100MHz` 晶振
- 8 位数码管显示数字
- 蜂鸣器
- 方向键
- 单刀双置开关
- LED 灯
- 数字矩阵键盘

在设置初始值模式下，数码管的最右侧两位为每瓶药片数，次右侧两位为总瓶数。
设置数值时，四位数中有一位会闪烁，标志着当前修改的位。
开发板上有上、下、左、右、中共 5 个方向键，利用了其中左、中、右三个控制设置初始值模式。
左右键选择当前修改的位，中键为确认按钮。

开关用于切换模式，置0时设置初始值，置1时开始计数。
计数时，数码管所有位均不闪烁。
其中最右侧两位和次右侧两位分别表示当前瓶中药片数和已装满瓶数，左侧三位数表示总药片数。
三组数之间用小数点分隔。

## 实现细节

### 编码风格

使用 VHDL 语言，版本为 [VHDL 2008](https://docs.xilinx.com/r/en-US/ug901-vivado-synthesis/Supported-VHDL-2008-Features)。
程序划分为不同模块（下文中的`entity`），主模块为`main.vhd`。每个`entity`分别写在单独的文件中，以`component`的形式被上层`entity`调用。

### 代码结构

- `main`
    - `count_pill_controller`
        - `pill_count_clk: divider`
        - `buzz_controller`
            - `buzz_clk: divider`
        - `pill_counter`
            - `sum_counter: counter`
            - `pill: counter`
            - `bottle: counter`
    - `set_num_controller`
        - `matrix_input`
        - `bling_selecter`
    - `BTN1: DeBounce`
    - ...
    - `BTN5: Debounce`
    - `divide_bling: divider`
    - `divide_debounce: divider`
    - `divide_mos_refresh: divider`
    - `ints_switcher`
    - `mos_driver`
    - `bling_driver`

### 模块划分

#### 工具类模块

`divider.vhd` 分频器

```vhdl
entity divider is
    port(
            CLK: in std_logic; -- CLK: 原始时钟
            RST: in std_logic; -- RST: 清零
            N: in integer;     -- N: 源周期/输出周期（N=2时，2分频）
            O: out std_logic   -- O: 输出时钟
        );
end entity divider;
```

`counter.vhd` 计数器
```vhdl
entity counter is
    port(
            CLK: in std_logic; -- CLK: 时钟
            RST: in std_logic; -- RST: 清零
            N: in integer;     -- N: 输入最大值
            O: out integer;    -- O: 输出计数值 [0, N-1] 闭区间
            C: out std_logic   -- C: 进位输出
        );
end entity counter;
```

`key_debounce.vhd` 按键消抖
```vhdl
entity DeBounce is
    port(
            Clock : in std_logic;     -- Clock: 时钟
            Reset : in std_logic;     -- Reset: 清零
            button_in : in std_logic; -- button_in: 输入原始信号
            pulse_out : out std_logic -- pulse_out: 输出消抖后信号
        );
end DeBounce;
```

#### 驱动器

`matrix_input.vhd` 矩阵键盘输入
```vhdl
entity matrix_input is
    port(
            CLK:in std_logic;                      -- CLK: 时钟
            CLR:in std_logic;                      -- CKR: 清零
            kcol:in std_logic_vector(3 downto 0);  -- kcol: 列信号
            krow:out std_logic_vector(3 downto 0); -- krow: 行信号
            seg_num:out integer                    -- seg_num: 输出数字
        );
end matrix_input;
```

`bling_driver.vhd` 数码管信号闪烁模块
```vhdl
entity bling_driver is
    port (
             bling_clk: in std_logic;                     -- 时钟
             bling_bit: in std_logic_vector(7 downto 0);  -- 闪烁的位，1有效
             MOS_INTS: in integer_vector(7 downto 0);     -- 数字原始信号
             MOS_DOTS: in std_logic_vector(7 downto 0);   -- 小数点原始信号
             O_MOS_INTS: out integer_vector(7 downto 0);  -- 数字输出信号
             O_MOS_DOTS: out std_logic_vector(7 downto 0) -- 小数点输出信号
         );
end entity bling_driver;
```

`mos_driver.vhd` 数码管显示驱动
```vhdl
entity mos_driver is
    port(
            INTS: in integer_vector(7 downto 0);      -- 数字，为10清零
            DOTS: in std_logic_vector(7 downto 0);    -- 小数点，'1' 不亮，'0' 亮
            CLK: in std_logic;                        -- 时钟
            OUTNUM: out std_logic_vector(7 downto 0); -- 输出数码管显示信号
            SELNUM: out std_logic_vector(7 downto 0)  -- 输出数码管数位选择信号
        );
end mos_driver;
```

`buzz_controller.vhd` 蜂鸣器驱动
```vhdl
entity buzz_controller is
    port (
             CLK: in std_logic;      -- 100MHz 时钟
             START: in std_logic;    -- 使能信号
             BUZZ_OUT: out std_logic -- 输出到蜂鸣器的脉冲
         );
end entity buzz_controller;
```

#### 逻辑控制器

`count_pill_controller.vhd` 药品计数模式控制器
```vhdl
entity count_pill_controller is
    port (
             CLK: in std_logic;                          -- 100MHz
             START: in std_logic;                        -- 1有效
             PILL_MAX: in integer;                       -- 每瓶最大药片数
             BOTTLE_MAX: in integer;                     -- 最大瓶数
             COUNT_INTS: out integer_vector(7 downto 0); -- 输出显示缓冲
             BUZZ: out std_logic                         -- 输出蜂鸣器使能
         );
end entity count_pill_controller;
```

`set_num_controller.vhd` 设置最大值模式控制器
```vhdl
entity set_num_controller is
    port (
             CLK: in std_logic;                          -- 100MHz 时钟
             START: in std_logic;                        -- 1 有效
             S1: in std_logic;                           -- 右按钮
             S2: in std_logic;                           -- 左按钮
             S4: in std_logic;                           -- 确认按钮
             kcol:in std_logic_vector(3 downto 0);       -- 矩阵键盘信号
             krow:out std_logic_vector(3 downto 0);      -- 矩阵键盘信号
             PILL_MAX: out integer;                      -- 每瓶最大药片数
             BOTTLE_MAX: out integer;                    -- 最大瓶数
             BLING_BIT: out std_logic_vector(7 downto 0); -- 正在闪烁的位
             SET_INTS: out integer_vector(7 downto 0)    -- 输出显示缓冲
         );
end entity set_num_controller;
```

`ints_switcher.vhd` 两种模式下显示输出缓冲区切换模块
```vhdl
entity ints_switcher is
    port (
             START: in std_logic;                       -- 标志着在哪个模式
             COUNT_INTS: in integer_vector(7 downto 0); -- 计数模式输出缓冲
             SET_INTS: in integer_vector(7 downto 0);   -- 置数模式输出缓冲
             MOS_INTS: out integer_vector(7 downto 0)   -- 选择当前模式的输出
         );
end entity ints_switcher;
```

#### 主模块`main.vhd`

> 控制红、绿指示灯的逻辑直接写在了主模块中

输入输出端口
```vhdl
entity main is
    port(
            CLK: in std_logic;
            START: in std_logic;
            kcol:in std_logic_vector(3 downto 0);
            krow:out std_logic_vector(3 downto 0);
            S1: in std_logic;
            S2: in std_logic;
            S3: in std_logic;
            S4: in std_logic;
            S5: in std_logic;
            OUTNUM: out std_logic_vector(7 downto 0);
            SELNUM: out std_logic_vector(7 downto 0);
            RED: out std_logic;
            GREEN: out std_logic;
            BUZZ: out std_logic
        );
end entity main;
```

`signal` 存储模块间的状态量
```vhdl
-- 消抖后的按钮
signal OS1: std_logic;
signal OS2: std_logic;
signal OS3: std_logic;
signal OS4: std_logic;
signal OS5: std_logic;
-- 分频后的时钟
signal one_second: std_logic := '0';
signal mos_refresh_clk: std_logic := '0';
signal bling_clk: std_logic := '0';
signal debounce_clk: std_logic := '0';
-- 数码管显示输出
-- 计数值
signal count_ints: integer_vector(7 downto 0) := (others => 0);
-- 设置值
signal set_ints: integer_vector(7 downto 0) := (others => 0);
-- 显示输出值
signal mos_ints: integer_vector(7 downto 0) := (others => 0);
signal mos_dots: std_logic_vector(7 downto 0) := "11101011";
-- 加闪烁后的输出值
signal o_mos_ints: integer_vector(7 downto 0) := (others => 0);
signal o_mos_dots: std_logic_vector(7 downto 0) := (others => '0');
-- 正在闪烁的位，1有效
signal bling_bit: std_logic_vector(7 downto 0);
-- 键盘输入的数字
signal matrix_num: integer := 0;
-- 当前设定的最大值
signal t_pill_max: integer;
signal t_bottle_max: integer;
-- 红灯状态
signal red_light: std_logic;
-- 绿灯状态
signal green_light: std_logic;
```

---

各模块逻辑实现细节见[源码](https://github.com/3DRX/pill_loading)

## 总结

在使用硬件描述语言设计较为复杂的系统时，我发现了硬件与软件在编程中的许多相同点与不同点。
- 相同点
    1. 在进行设计时，都要遵循自定向下的设计方式，将复杂功能拆分为多个简单功能的组合。
    2. 将模块拆分到不同文件中，组成软件包，也调用库中的软件包，便于复用。
    3. 同一语言的不同版本之间区别不可忽略，语法不一定向后兼容，在进行开发时要对环境充分了解，避免因语言、环境版本导致的问题。
    4. 在接触新环境时，都需要大量阅读文档。
- 不同点
    1. 硬件设计的逻辑更多的是并行的而非软件开发中所习惯的串行的。
    2. 硬件开发需要对于硬件本身十分了解。
    3. 硬件开发过程中模拟仿真十分重要，进行模拟仿真看似增长了开发流程，却反而能使问题更早被发现，提高开发效率。

