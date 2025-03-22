# Contributing to OptimaLLM WebUI

🎉 First off, thanks for taking the time to contribute! 🎉

The following is a set of guidelines for contributing to OptimaLLM WebUI. These are mostly guidelines, not rules. Use your best judgment, and feel free to propose changes to this document in a pull request.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [How Can I Contribute?](#how-can-i-contribute)
  - [Reporting Bugs](#reporting-bugs)
  - [Suggesting Enhancements](#suggesting-enhancements)
  - [Your First Code Contribution](#your-first-code-contribution)
  - [Pull Requests](#pull-requests)
- [Development Workflow](#development-workflow)
  - [Setting Up Development Environment](#setting-up-development-environment)
  - [Coding Style](#coding-style)
  - [Testing Guidelines](#testing-guidelines)
  - [Documentation](#documentation)
- [Project Structure](#project-structure)

## Code of Conduct

This project and everyone participating in it is governed by our Code of Conduct. By participating, you are expected to uphold this code. Please report unacceptable behavior.

## How Can I Contribute?

### Reporting Bugs

Bugs are tracked as [GitHub issues](https://github.com/BjornMelin/optima-llm-webui/issues). When you create an issue, please use the bug report template and provide as much detail as possible:

- **Use a clear and descriptive title** for the issue
- **Describe the exact steps to reproduce the bug**
- **Provide specific examples** to demonstrate the steps
- **Describe the behavior you observed after following the steps**
- **Explain which behavior you expected to see instead**
- **Include details about your hardware configuration**
- **Include screenshots and logs** if possible

### Suggesting Enhancements

Enhancements are also tracked as GitHub issues. When creating an enhancement suggestion, please provide:

- **Use a clear and descriptive title**
- **Provide a step-by-step description of the suggested enhancement**
- **Explain why this enhancement would be useful**
- **Include screenshots and mockups** if applicable

### Your First Code Contribution

Unsure where to begin contributing? You can start by looking through these `beginner` and `help-wanted` issues:

- [Beginner issues](https://github.com/BjornMelin/optima-llm-webui/labels/beginner) - issues which should only require a few lines of code
- [Help wanted issues](https://github.com/BjornMelin/optima-llm-webui/labels/help%20wanted) - issues which should be a bit more involved than beginner issues

### Pull Requests

- Fill in the required template
- Do not include issue numbers in the PR title
- Include screenshots and animated GIFs if applicable
- Follow the [Python](#coding-style) styleguide
- Document new code
- End all files with a newline
- Avoid platform-dependent code

## Development Workflow

### Setting Up Development Environment

```bash
# Clone the repository
git clone https://github.com/BjornMelin/optima-llm-webui.git
cd optima-llm-webui

# Setup the development environment
./scripts/setup-env.sh --dev

# Run linters and formatters
pre-commit install
```

### Coding Style

We follow the [PEP 8](https://www.python.org/dev/peps/pep-0008/) style guide for Python code. Additionally:

- Use 4 spaces for indentation
- Use snake_case for variables, functions, and methods
- Use UPPERCASE for constants
- Use PascalCase for class names
- Limit line length to 88 characters
- Use type hints where possible
- Document functions, classes, and modules

We use `ruff` and `black` for linting and formatting. Run them before submitting PRs:

```bash
ruff check .
black .
```

### Testing Guidelines

We use pytest for testing. Please write tests for new code, and ensure all tests pass before submitting PRs:

```bash
pytest
```

For hardware-dependent functionality, please include mock tests that can run on CI.

### Documentation

- Use docstrings for all functions, classes, and modules
- Keep documentation up-to-date with code changes
- Update the README.md when necessary
- When adding new features, add appropriate documentation in the docs/ directory

## Project Structure

```
optima-llm-webui/
├── .env.example                # Example environment variables
├── .gitignore                  # Git ignore file
├── README.md                   # Main documentation
├── LICENSE                     # License file (MIT)
├── docs/                       # Detailed documentation
│   ├── hardware-detection.md   # Hardware detection documentation
│   ├── model-registry.md       # Model registry documentation
│   ├── configuration.md        # Configuration options
│   ├── troubleshooting.md      # Troubleshooting guide
│   ├── multimodal.md           # Multimodal model usage guide
│   └── images/                 # Documentation images
├── scripts/                    # Utility scripts
│   ├── hardware_detection.py   # Hardware detection module
│   ├── model_registry.py       # Model registry module
│   ├── model_manager.py        # Enhanced model manager
│   ├── setup-env.sh            # Environment setup script
│   ├── setup-nvidia.sh         # NVIDIA GPU setup script
│   └── start.sh                # System startup script
├── docker/                     # Docker configuration
│   ├── docker-compose.yaml     # Main compose file
│   ├── docker-compose.gpu.yaml # GPU-specific overrides
│   ├── docker-compose.multimodal.yaml # Multimodal-specific config
│   └── .dockerignore           # Docker ignore file
└── config/                     # Configuration files
    ├── hardware_profiles.json  # Hardware profile database
    ├── model_registry.json     # Model registry database
    ├── models.json             # User's configured models
    └── multimodal_config/      # Configuration for multimodal models
```

Thank you for contributing to OptimaLLM WebUI!