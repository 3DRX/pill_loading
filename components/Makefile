GHDL=ghdl
FLAGS="--std=08"
NAME="bling_selecter"

all:
	$(GHDL) -a $(FLAGS) $(NAME)_tb.vhd $(NAME).vhd btn_driver.vhd
	$(GHDL) -e $(FLAGS) $(NAME)_tb
	$(GHDL) -r $(FLAGS) $(NAME)_tb --wave=wave.ghw --stop-time=1us

clean:
	rm *.cf *.ghw
