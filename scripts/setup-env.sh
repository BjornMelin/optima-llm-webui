#!/bin/bash

set -e

PYTHON_VERSION="3.10"
VIRTUAL_ENV_DIR=".venv"

echo "🔍 Setting up OptimaLLM WebUI environment..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python not found. Please install Python $PYTHON_VERSION or higher."
    exit 1
fi

# Check Python version
PYTHON_INSTALLED_VERSION=$(python3 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')
if [[ "$PYTHON_INSTALLED_VERSION" < "$PYTHON_VERSION" ]]; then
    echo "❌ Python $PYTHON_VERSION or higher is required. You have Python $PYTHON_INSTALLED_VERSION."
    exit 1
fi

echo "✅ Found Python $PYTHON_INSTALLED_VERSION"

# Check if pip is installed
if ! command -v pip &> /dev/null; then
    echo "❌ pip not found. Please install pip."
    exit 1
fi

echo "✅ Found pip"

# Check if virtual environment exists
if [ ! -d "$VIRTUAL_ENV_DIR" ]; then
    echo "🔧 Creating virtual environment in $VIRTUAL_ENV_DIR..."
    python3 -m venv $VIRTUAL_ENV_DIR
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source $VIRTUAL_ENV_DIR/bin/activate

# Install/update uv if not present
if ! command -v uv &> /dev/null; then
    echo "🔧 Installing uv..."
    pip install -U uv
fi

echo "✅ Using uv for dependency management"

# Install Python dependencies
echo "🔧 Installing dependencies..."
uv pip install -r requirements.txt

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "⚠️ Docker not found. Please install Docker to continue."
    echo "📝 Visit https://docs.docker.com/get-docker/ for installation instructions."
else
    echo "✅ Found Docker"
    
    # Check if Docker Compose is installed
    if ! docker compose version &> /dev/null; then
        echo "⚠️ Docker Compose not found. Please install Docker Compose to continue."
        echo "📝 Visit https://docs.docker.com/compose/install/ for installation instructions."
    else
        echo "✅ Found Docker Compose"
    fi
fi

# Create necessary directories
echo "🔧 Creating necessary directories..."
mkdir -p models config/multimodal_config webui-data docs/images

# Copy example config files if they don't exist
if [ ! -f "config/hardware_profiles.json" ]; then
    echo "🔧 Creating initial hardware profiles configuration..."
    cp config/hardware_profiles.json.example config/hardware_profiles.json
fi

if [ ! -f "config/model_registry.json" ]; then
    echo "🔧 Creating initial model registry configuration..."
    cp config/model_registry.json.example config/model_registry.json
fi

if [ ! -f ".env" ]; then
    echo "🔧 Creating initial .env file..."
    cp .env.example .env
fi

echo "✅ Environment setup complete!"
echo "🚀 Next steps:"
echo "  1. Run './scripts/setup-nvidia.sh' to check GPU support"
echo "  2. Run 'python scripts/model_manager.py auto-recommend' to get model recommendations"
echo "  3. Run 'python scripts/model_manager.py add <model>' to add a model"
echo "  4. Run './scripts/start.sh' to start the system"

# Deactivate virtual environment
deactivate