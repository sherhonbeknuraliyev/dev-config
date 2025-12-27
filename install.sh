#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_step() { echo -e "${BLUE}==>${NC} $1"; }
print_success() { echo -e "${GREEN}✓${NC} $1"; }
print_warning() { echo -e "${YELLOW}!${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

echo ""
echo -e "${BLUE}╔════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       Dev Environment Installer        ║${NC}"
echo -e "${BLUE}║   Neovim + Tmux + Nerd Fonts + Tools   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════╝${NC}"
echo ""

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ -f /etc/debian_version ]]; then
    OS="debian"
elif [[ -f /etc/redhat-release ]]; then
    OS="redhat"
else
    OS="unknown"
fi

print_step "Detected OS: $OS"

# Install dependencies
print_step "Installing dependencies..."

if [[ "$OS" == "macos" ]]; then
    if ! command -v brew &> /dev/null; then
        print_step "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install neovim tmux git curl unzip ripgrep fd node npm python3 go 2>/dev/null || true
elif [[ "$OS" == "debian" ]]; then
    sudo apt-get update
    sudo apt-get install -y neovim tmux git curl unzip ripgrep fd-find nodejs npm python3 python3-pip golang-go xclip 2>/dev/null || true
elif [[ "$OS" == "redhat" ]]; then
    sudo dnf install -y neovim tmux git curl unzip ripgrep fd-find nodejs npm python3 python3-pip golang xclip 2>/dev/null || true
fi

print_success "Dependencies installed"

# Create temp directory and clone repo
TEMP_DIR=$(mktemp -d)
print_step "Downloading config files..."
git clone --depth 1 https://github.com/sherhonbeknuraliyev/dev-config.git "$TEMP_DIR/dev-config" 2>/dev/null || {
    print_error "Failed to clone repository"
    exit 1
}
print_success "Config files downloaded"

# Backup existing configs
print_step "Backing up existing configs..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

if [[ -d "$HOME/.config/nvim" ]]; then
    mv "$HOME/.config/nvim" "$BACKUP_DIR/nvim"
    print_warning "Backed up existing nvim config to $BACKUP_DIR/nvim"
fi

if [[ -f "$HOME/.tmux.conf" ]]; then
    mv "$HOME/.tmux.conf" "$BACKUP_DIR/.tmux.conf"
    print_warning "Backed up existing tmux.conf to $BACKUP_DIR/.tmux.conf"
fi

if [[ -d "$HOME/.tmux" ]]; then
    mv "$HOME/.tmux" "$BACKUP_DIR/.tmux"
    print_warning "Backed up existing .tmux to $BACKUP_DIR/.tmux"
fi

# Install Neovim config
print_step "Installing Neovim config..."
mkdir -p "$HOME/.config"
cp -r "$TEMP_DIR/dev-config/nvim" "$HOME/.config/nvim"
print_success "Neovim config installed"

# Install Tmux config
print_step "Installing Tmux config..."
cp "$TEMP_DIR/dev-config/tmux/.tmux.conf" "$HOME/.tmux.conf"
mkdir -p "$HOME/.tmux"
cp "$TEMP_DIR/dev-config/tmux/"*.sh "$HOME/.tmux/" 2>/dev/null || true
cp "$TEMP_DIR/dev-config/tmux/"*.conf "$HOME/.tmux/" 2>/dev/null || true
cp "$TEMP_DIR/dev-config/tmux/"*.md "$HOME/.tmux/" 2>/dev/null || true
chmod +x "$HOME/.tmux/"*.sh 2>/dev/null || true
print_success "Tmux config installed"

# Install TPM (Tmux Plugin Manager)
print_step "Installing Tmux Plugin Manager..."
if [[ ! -d "$HOME/.tmux/plugins/tpm" ]]; then
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm" 2>/dev/null
    print_success "TPM installed"
else
    print_warning "TPM already installed"
fi

# Install Nerd Font
print_step "Installing JetBrainsMono Nerd Font..."
mkdir -p "$HOME/.local/share/fonts"
cd "$HOME/.local/share/fonts"
if [[ ! -d "JetBrainsMono" ]]; then
    curl -fsSLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
    unzip -o JetBrainsMono.zip -d JetBrainsMono >/dev/null 2>&1
    rm -f JetBrainsMono.zip
    if command -v fc-cache &> /dev/null; then
        fc-cache -fv >/dev/null 2>&1
    fi
    print_success "JetBrainsMono Nerd Font installed"
else
    print_warning "JetBrainsMono Nerd Font already installed"
fi

# Create undo directory for nvim
mkdir -p "$HOME/.vim/undodir"

# Add dev alias to shell configs
print_step "Adding 'dev' alias to shell..."
DEV_ALIAS='alias dev="~/.tmux/dev.sh"'

if [[ -f "$HOME/.bashrc" ]] && ! grep -q "alias dev=" "$HOME/.bashrc"; then
    echo "" >> "$HOME/.bashrc"
    echo "# Dev environment alias" >> "$HOME/.bashrc"
    echo "$DEV_ALIAS" >> "$HOME/.bashrc"
    print_success "Added alias to .bashrc"
fi

if [[ -f "$HOME/.zshrc" ]] && ! grep -q "alias dev=" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# Dev environment alias" >> "$HOME/.zshrc"
    echo "$DEV_ALIAS" >> "$HOME/.zshrc"
    print_success "Added alias to .zshrc"
fi

# Cleanup
rm -rf "$TEMP_DIR"

# Final message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║       Installation Complete!           ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo ""
echo "  1. Set your terminal font to 'JetBrainsMono Nerd Font'"
echo ""
echo "  2. Reload your shell:"
echo "     source ~/.bashrc  # or source ~/.zshrc"
echo ""
echo "  3. Open Neovim to install plugins:"
echo "     nvim"
echo ""
echo "  4. Install Tmux plugins (inside tmux):"
echo "     Press: Ctrl+a then I (capital i)"
echo ""
echo "  5. Start a dev session:"
echo "     dev ~/your/project"
echo ""
echo -e "${BLUE}Cheatsheets:${NC}"
echo "  - Neovim: ~/.config/nvim/CHEATSHEET.md"
echo "  - Tmux:   ~/.tmux/CHEATSHEET.md"
echo ""
echo -e "${GREEN}Happy coding!${NC}"
echo ""
