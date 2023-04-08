GHDL=ghdl
FLAGS="--std=08"
NAME="pill_counter"

all:
	$(GHDL) -a $(FLAGS) $(NAME)_tb.vhd $(NAME).vhd counter.vhd
	$(GHDL) -e $(FLAGS) $(NAME)_tb
	$(GHDL) -r $(FLAGS) $(NAME)_tb --wave=wave.ghw --stop-time=1000ns

clean:
	rm *.cf *.ghw
