LATEX ?= latex -interaction nonstopmode
ERROR_CASES   := $(wildcard tests/error-*.tex)
SUCCESS_CASES := $(wildcard tests/success-*.tex)

test :: $(ERROR_CASES) $(SUCCESS_CASES)

$(ERROR_CASES) ::
	$(info "it is $(LATEX)")
	@echo "Testing $@..."
	! $(LATEX) $@
	@echo "Testing $@...done"

$(SUCCESS_CASES) ::
	@echo "Testing $@..."
	$(LATEX) $@
	@echo "Testing $@...done"

clean:
	rm $(wildcard *.aux)
	rm $(wildcard *.dvi)
	rm $(wildcard *.pdf)
	rm $(wildcard *.log)
