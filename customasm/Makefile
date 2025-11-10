CUSTOMASM_URL="https://github.com/hlorenzi/customasm/releases/download/v0.13.12/customasm_v0.13.12_linux_musl.zip"
CUSTOMASM_ROOT=$(PROJECT_ROOT)/customasm

.PHONY: setup-customasm
setup-customasm:
	curl -L $(CUSTOMASM_URL) > $(CUSTOMASM_ROOT)/customasm.zip
	unzip -o $(CUSTOMASM_ROOT)/customasm.zip -d $(CUSTOMASM_ROOT)
	rm $(CUSTOMASM_ROOT)/customasm.zip
