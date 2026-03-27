AGENTS_DIR  := agents
INSTALL_DIR := $(HOME)/.claude/agents
SCRIPT      := scripts/validate-agents.sh

.PHONY: help validate install uninstall

help:
	@echo "Available targets:"
	@echo "  validate   Validate all agent frontmatter"
	@echo "  install    Copy agents to ~/.claude/agents/"
	@echo "  uninstall  Remove agents from ~/.claude/agents/"

validate:
	@bash $(SCRIPT) $(AGENTS_DIR)

install:
	@mkdir -p $(INSTALL_DIR)
	@cp -v $(AGENTS_DIR)/*.md $(INSTALL_DIR)/
	@echo "Agents installed to $(INSTALL_DIR)"

uninstall:
	@for f in $(AGENTS_DIR)/*.md; do \
		target=$(INSTALL_DIR)/$$(basename $$f); \
		if [ -f "$$target" ]; then \
			rm -v "$$target"; \
		fi; \
	done
	@echo "Agents removed from $(INSTALL_DIR)"
