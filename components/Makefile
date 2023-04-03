GHDL=ghdl
FLAGS="--std=08"
NAME="mos_driver"

all:
	$(GHDL) -a $(FLAGS) $(NAME)_tb.vhd $(NAME).vhd
	$(GHDL) -e $(FLAGS) $(NAME)_tb
	$(GHDL) -r $(FLAGS) $(NAME)_tb --wave=wave.ghw --stop-time=1us

clean:
	rm *.cf *.ghw
