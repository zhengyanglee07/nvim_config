# 🎨 NvChad Configuration

A modern, feature-rich Neovim configuration built on top of NvChad with AI-powered coding assistance, Flutter development support, and enhanced markdown editing capabilities.

<img width="2540" height="989" alt="Screenshot 2025-10-13 230609" src="https://github.com/user-attachments/assets/526ac14e-b568-4a56-921a-17cd9509ba96" />

## ✨ Features

### 🎨 Theme & UI

- **Theme**: Radium with light mode toggle support
- **Statusline**: Minimal theme with custom configuration
- **Tabufline**: Enhanced buffer and tab management
- **Telescope**: Borderless style for a clean, modern look
- **Colorify**: Virtual text color preview for hex colors and LSP variables
- **Noice**: Enhanced UI for messages, cmdline, and popupmenu

### 🤖 AI Coding Assistants

#### CodeCompanion

AI-powered coding assistant using Claude 3.5 Sonnet via GitHub Copilot:

- Interactive chat interface with pinned and watched buffers
- Action palette for quick prompts
- Integrated diff viewer with mini.diff
- Inline code assistance

#### GitHub Copilot

- Real-time code suggestions and completions
- Context-aware recommendations

#### ChatGPT (GPT-4o-mini)

Multiple AI-powered operations:

- **Text Processing**: Grammar correction, translation, keyword extraction
- **Code Generation**: Documentation, tests, optimization
- **Code Analysis**: Bug fixing, explanation, readability analysis

### 💻 Language Support

#### LSP Servers

- **Web Development**:
  - HTML, CSS, Tailwind CSS
  - TypeScript/JavaScript (with Vue support)
  - Volar (Vue)
- **Systems Programming**:
  - C/C++ (clangd)
  - Rust
  - Go
- **Scripting**:
  - Python (Pyright)
  - Lua
- **DevOps**:
  - YAML
  - Docker
  - Terraform
- **Mobile**:
  - Dart/Flutter
- **Others**:
  - Clojure
  - CMake
  - Vim
  - Markdown (MPLS)

#### Flutter Development

Comprehensive Flutter support with:

- LSP integration with color visualization
- Widget guides and closing tags
- Dev tools and outline support
- Enhanced Dart syntax highlighting

### ⚡ Editing & Productivity

- **Conform.nvim**: Multi-language code formatting
- **nvim-cmp**: Smart autocompletion with custom styling
- **Indent Blankline**: Visual indentation guides
- **nvim-ufo**: Advanced folding capabilities
- **mini.diff**: Git diff visualization in sign column
- **Gitsigns**: Enhanced git integration with inline blame
- **LazyGit**: Full-featured terminal UI for git operations
- **nvim-treesitter**: Advanced syntax highlighting and code understanding
- **which-key**: Interactive keybinding discovery
- **Telescope**: Fuzzy finder for files, buffers, and more

### 📝 Markdown & Note-Taking

- **Markview**: Live markdown preview with emoji support
- **RocketNotes**: Integrated note-taking plugin
- **MPLS**: Markdown language server with browser preview

## 📋 Prerequisites

### Required

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** >= 16.x (for LSP servers)
- \*\*npm
