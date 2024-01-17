# List of all script files in the current directory
SCRIPTS := $(wildcard *.sh)

# Prefix for the destination files
DEST_PREFIX := kubectl-

# Destination directory
DEST_DIR := /usr/local/bin

# Target: Move and rename scripts
add-plugins:
	@for script in $(SCRIPTS); do \
		dest_file=$(DEST_DIR)/$(DEST_PREFIX)$$(basename "$$script" .sh); \
		echo "Moving $$script to $$dest_file"; \
		cp "$$script" "$$dest_file"; \
	done

# Target: Clean up (remove scripts from /usr/local/bin)
remove-plugins:
	@for script in $(SCRIPTS); do \
		dest_file=$(DEST_DIR)/$(DEST_PREFIX)$$(basename "$$script"); \
		if [ -e "$$dest_file" ]; then \
			echo "Removing $$dest_file"; \
			rm -f "$$dest_file"; \
		fi; \
	done
