GHDL=ghdl
FLAGS="--std=08"
NAME="divider"

all:
	$(GHDL) -a $(FLAGS) $(NAME)_tb.vhd $(NAME).vhd
	$(GHDL) -e $(FLAGS) $(NAME)_tb
	$(GHDL) -r $(FLAGS) $(NAME)_tb --wave=wave.ghw --stop-time=1us

main:
	$(GHDL) -a $(FLAGS) main.vhd counter.vhd divider.vhd key_seg.vhd mos_driver.vhd
	$(GHDL) -e $(FLAGS) main
	$(GHDL) -r $(FLAGS) main --wave=wave.ghw --stop-time=1us

clean:
	rm *.cf *.ghw
