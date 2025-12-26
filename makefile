IMAGE_NAME = latex-env
DOCKER_CMD = docker run --rm -v $(PWD):/workdir $(IMAGE_NAME)

# Set PROJECT variable to the project directory name under src/
# Usage: make PROJECT=project_1
PROJECT_DIR = src/$(PROJECT)

.PHONY: all build clean

all: build-pdf

build-image:
	docker build -t $(IMAGE_NAME) .

build-pdf:
	@if [ -z "$(PROJECT)" ]; then \
		echo "Error: PROJECT is not set. Use 'make PROJECT=project_name'"; \
		exit 1; \
	fi
	$(DOCKER_CMD) latexmk -pdf -cd $(PROJECT_DIR)/main.tex

clean:
	@if [ -z "$(PROJECT)" ]; then \
		echo "Error: PROJECT is not set. Use 'make clean PROJECT=project_name'"; \
		exit 1; \
	fi
	$(DOCKER_CMD) latexmk -C -cd $(PROJECT_DIR)/main.tex
	rm -f $(PROJECT_DIR)/*.pdf
