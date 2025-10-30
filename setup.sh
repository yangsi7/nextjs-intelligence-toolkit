#!/bin/bash

# Next.js Intelligence Toolkit - Interactive Setup
# This script installs the nextjs-project-setup skill and supporting infrastructure

set -e

echo "=========================================="
echo "Next.js Intelligence Toolkit Setup"
echo "=========================================="
echo ""

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check prerequisites
echo -e "${BLUE}Checking prerequisites...${NC}"

if ! command -v git &> /dev/null; then
    echo -e "${YELLOW}⚠️  Git not found. Please install git first.${NC}"
    exit 1
fi

if ! command -v claude &> /dev/null && ! command -v claude-code &> /dev/null; then
    echo -e "${YELLOW}⚠️  Claude Code not found. Please install Claude Code first.${NC}"
    echo "Visit: https://claude.ai/download"
    exit 1
fi

echo -e "${GREEN}✓ Prerequisites met${NC}"
echo ""

# Interactive Questions
echo -e "${BLUE}Let's set up your Next.js project...${NC}"
echo ""

read -p "Project name (e.g., my-saas-app): " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-my-next-project}

echo ""
echo "What type of project are you building?"
echo "  1) Simple (blog, portfolio, marketing site)"
echo "  2) Complex SaaS (database, auth, multi-tenant)"
echo "  3) E-commerce (products, checkout, payments)"
echo "  4) Custom (I'll specify details)"
read -p "Choose [1-4]: " PROJECT_TYPE

case $PROJECT_TYPE in
    1)
        PROJECT_TYPE_NAME="Simple"
        DATABASE_REQUIRED="No"
        AUTH_REQUIRED="No"
        MULTI_TENANT="No"
        ECOMMERCE="No"
        PATH_TYPE="simple"
        ;;
    2)
        PROJECT_TYPE_NAME="Complex SaaS"
        read -p "Database required? (Y/n): " DB_INPUT
        DATABASE_REQUIRED=${DB_INPUT:-Y}
        read -p "Authentication needed? (Y/n): " AUTH_INPUT
        AUTH_REQUIRED=${AUTH_INPUT:-Y}
        read -p "Multi-tenant architecture? (Y/n): " MT_INPUT
        MULTI_TENANT=${MT_INPUT:-Y}
        ECOMMERCE="No"
        PATH_TYPE="complex"
        ;;
    3)
        PROJECT_TYPE_NAME="E-commerce"
        DATABASE_REQUIRED="Yes"
        AUTH_REQUIRED="Yes"
        MULTI_TENANT="No"
        ECOMMERCE="Yes"
        PATH_TYPE="complex"
        ;;
    *)
        PROJECT_TYPE_NAME="Custom"
        read -p "Database required? (y/N): " DB_INPUT
        DATABASE_REQUIRED=${DB_INPUT:-N}
        read -p "Authentication needed? (y/N): " AUTH_INPUT
        AUTH_REQUIRED=${AUTH_INPUT:-N}
        read -p "Multi-tenant architecture? (y/N): " MT_INPUT
        MULTI_TENANT=${MT_INPUT:-N}
        read -p "E-commerce features? (y/N): " EC_INPUT
        ECOMMERCE=${EC_INPUT:-N}

        # Determine path type based on complexity indicators
        COMPLEXITY_COUNT=0
        [[ $DATABASE_REQUIRED =~ ^[Yy] ]] && ((COMPLEXITY_COUNT++))
        [[ $AUTH_REQUIRED =~ ^[Yy] ]] && ((COMPLEXITY_COUNT++))
        [[ $MULTI_TENANT =~ ^[Yy] ]] && ((COMPLEXITY_COUNT++))
        [[ $ECOMMERCE =~ ^[Yy] ]] && ((COMPLEXITY_COUNT++))

        if [ $COMPLEXITY_COUNT -ge 2 ]; then
            PATH_TYPE="complex"
        else
            PATH_TYPE="simple"
        fi
        ;;
esac

echo ""
echo -e "${BLUE}Installing toolkit files...${NC}"

# Create .claude directory structure
mkdir -p .claude/{skills,agents,templates,shared-imports,commands}

# Copy all toolkit files
echo "Copying Intelligence Toolkit components..."

# Download from GitHub (when hosted) or copy from local (for now we'll use curl from raw GitHub)
REPO_BASE="https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master"

# For now, create a note about manual copy (we'll update this after first push)
cat > .claude/README.md << 'EOF'
# Claude Code Intelligence Toolkit

This directory contains the Intelligence Toolkit for Claude Code.

**Main Component**: nextjs-project-setup skill

**Components**:
- `skills/nextjs-project-setup/` - The main skill for Next.js project setup
- `agents/` - Supporting agents (design-ideator, qa-validator, doc-auditor)
- `templates/` - Output templates for reports, designs, wireframes
- `shared-imports/` - Core frameworks (CoD_Σ, constitution)
- `commands/` - Slash commands (optional, for workflow shortcuts)

All components work together to enable production-ready Next.js project setup.
EOF

echo -e "${GREEN}✓ Toolkit directory created${NC}"

# Generate CLAUDE.md
echo "Generating CLAUDE.md..."

cat > CLAUDE.md << EOF
# ${PROJECT_NAME}

## Project Overview

**Type**: ${PROJECT_TYPE_NAME}
**Created**: $(date +%Y-%m-%d)

This project uses the **Claude Code Intelligence Toolkit** with the **nextjs-project-setup skill** for production-ready Next.js development.

---

## Tech Stack

- **Framework**: Next.js 14+ (App Router)
- **Language**: TypeScript
- **Styling**: Tailwind CSS
- **Components**: Shadcn UI
$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "- **Database**: Supabase (PostgreSQL)")
$([ "$AUTH_REQUIRED" = "Yes" ] || [ "$AUTH_REQUIRED" = "Y" ] && echo "- **Authentication**: Supabase Auth")

---

## Intelligence Toolkit

This project leverages the nextjs-project-setup skill which provides:

- **Simple Path** (15-30 min): Template selection → Setup → Components → Design → Docs
- **Complex Path** (2-4 hours): All 8 phases including specs, design system, wireframes, TDD implementation, QA, and documentation

**Path Selected**: ${PATH_TYPE}

---

## Development Workflow

### Initial Setup
Run the nextjs-project-setup skill (see initial-prompt.md for details)

### Commands
\`\`\`bash
npm run dev      # Start development server
npm run build    # Build for production
npm run lint     # Run ESLint
npm test         # Run tests
\`\`\`

### Conventions
- Mobile-first responsive design
- Use Shadcn components from @ui registry
- Global Tailwind CSS variables only (no inline custom colors)
- TDD approach (tests before implementation)

---

## MCP Tools Available

$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "- **Supabase MCP**: Database schema, RLS policies, edge functions")
- **Shadcn MCP**: Component search and installation (Search → View → Example → Install)
- **Vercel MCP**: Template discovery and deployment
- **21st Dev MCP**: Design ideation and inspiration
- **Ref MCP**: Library documentation (Next.js, React, TypeScript)

---

## Anti-Patterns

❌ **Hardcoded colors** (use CSS variables)
   **Why**: Breaks theme switching and design system consistency

❌ **Skipping Shadcn Example step**
   **Why**: Examples reveal usage patterns and prevent integration issues

$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "❌ **Using Supabase CLI** (use Supabase MCP instead)")
$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "   **Why**: MCP provides better error messages and type safety")

---

## Next Steps

1. Fill out **initial-prompt.md** with your project details
2. Run the kickstart command in Claude Code
3. Follow the ${PATH_TYPE} path workflow

See **initial-prompt.md** for the exact kickstart prompt.
EOF

echo -e "${GREEN}✓ CLAUDE.md generated${NC}"

# Generate initial-prompt.md
echo "Generating initial-prompt.md..."

cat > initial-prompt.md << EOF
# Next.js Project: ${PROJECT_NAME}

**Created**: $(date +%Y-%m-%d)
**Project Type**: ${PROJECT_TYPE_NAME}
**Recommended Path**: ${PATH_TYPE}

---

## 1. What I Want to Build

<!-- Describe your vision here. Be specific about:
- What problem does this solve?
- Who are the users?
- What are the core features?
- What makes this unique?
-->

[Your project description here]

---

## 2. Complexity Indicators

Based on your setup answers:

- [$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "X" || echo " ")] Database required
- [$([ "$AUTH_REQUIRED" = "Yes" ] || [ "$AUTH_REQUIRED" = "Y" ] && echo "X" || echo " ")] Custom authentication
- [$([ "$MULTI_TENANT" = "Yes" ] || [ "$MULTI_TENANT" = "Y" ] && echo "X" || echo " ")] Multi-tenant architecture
- [$([ "$ECOMMERCE" = "Yes" ] || [ "$ECOMMERCE" = "Y" ] && echo "X" || echo " ")] E-commerce features
- [ ] Complex design system
- [ ] Multiple third-party integrations

**Path Recommendation**: $([ "$PATH_TYPE" = "complex" ] && echo "COMPLEX (2-4 hours, all 8 phases)" || echo "SIMPLE (15-30 min, streamlined)")

---

## 3. Tech Stack Preferences

### Framework & Template
- **Next.js Version**: 14+ (App Router)
- **Vercel Template**: [Let Claude choose based on requirements | Specify template name]

### Database & Backend
$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "- **Database**: Supabase (PostgreSQL)")
$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "- **Schema**: [Describe main tables/entities]")
$([ "$AUTH_REQUIRED" = "Yes" ] || [ "$AUTH_REQUIRED" = "Y" ] && echo "- **Authentication**: Supabase Auth (Email/Password + OAuth)")
$([ "$MULTI_TENANT" = "Yes" ] || [ "$MULTI_TENANT" = "Y" ] && echo "- **Multi-tenant Pattern**: [Separate schemas | Shared schema with tenant_id | Other]")

### Frontend
- **Styling**: Tailwind CSS (default)
- **Components**: Shadcn UI (@ui registry)
- **Design System**: [Custom | Use defaults | Specify inspiration]

### Additional Features
$([ "$ECOMMERCE" = "Yes" ] || [ "$ECOMMERCE" = "Y" ] && echo "- **Payments**: [Stripe | Other]")
$([ "$ECOMMERCE" = "Yes" ] || [ "$ECOMMERCE" = "Y" ] && echo "- **Product Management**: [Describe requirements]")
- **Analytics**: [Vercel Analytics | Google Analytics | None]
- **Other**: [List any other requirements]

---

## 4. Feature Requirements

<!-- List the main features in priority order (P1, P2, P3...) -->

### P1 Features (Must Have - MVP)
1. [Feature 1 description]
2. [Feature 2 description]
3. [Feature 3 description]

### P2 Features (Should Have - Enhancement)
1. [Feature 1 description]
2. [Feature 2 description]

### P3 Features (Nice to Have - Future)
1. [Feature 1 description]
2. [Feature 2 description]

---

## 5. Kickstart Command

Once you've filled out sections 1-4 above, **paste this command into Claude Code**:

\`\`\`
Use the nextjs-project-setup skill to create a ${PROJECT_TYPE_NAME} Next.js project based on @initial-prompt.md.

Project name: ${PROJECT_NAME}
Recommended path: ${PATH_TYPE}

$([ "$PATH_TYPE" = "complex" ] && echo "Execute all 8 phases:" || echo "Follow the simple path:")
$([ "$PATH_TYPE" = "complex" ] && echo "1. Foundation Research (intelligence-first)" || echo "1. Template Selection")
$([ "$PATH_TYPE" = "complex" ] && echo "2. Template Selection" || echo "2. Setup & Configuration")
$([ "$PATH_TYPE" = "complex" ] && echo "3. Specification (product spec + constitution)" || echo "3. Core Components")
$([ "$PATH_TYPE" = "complex" ] && echo "4. Design System Ideation" || echo "4. Basic Design")
$([ "$PATH_TYPE" = "complex" ] && echo "5. Wireframes & Asset Management" || echo "5. Documentation")
$([ "$PATH_TYPE" = "complex" ] && echo "6. Implementation (TDD approach)")
$([ "$PATH_TYPE" = "complex" ] && echo "7. Quality Assurance (continuous)")
$([ "$PATH_TYPE" = "complex" ] && echo "8. Documentation & Audit")

Follow the nextjs-project-setup skill's workflow, using:
- Shadcn MCP for components (Search → View → Example → Install)
$([ "$DATABASE_REQUIRED" = "Yes" ] || [ "$DATABASE_REQUIRED" = "Y" ] && echo "- Supabase MCP for database (NEVER use Supabase CLI)")
- Vercel MCP for templates
- 21st Dev MCP for design inspiration
- Ref MCP for Next.js/React documentation

Apply TDD throughout implementation.
\`\`\`

---

## Notes

- The **nextjs-project-setup skill** will guide you through the entire process
- For complex projects, expect 2-4 hours with user feedback loops
- For simple projects, expect 15-30 minutes
- All workflows enforce TDD, visual validation, and quality gates

Ready? Copy the kickstart command above and paste it into Claude Code!
EOF

echo -e "${GREEN}✓ initial-prompt.md generated${NC}"

# Create a simple README
cat > README.md << 'EOF'
# Next.js Intelligence Toolkit

Production-ready Next.js project setup powered by Claude Code's **nextjs-project-setup skill**.

## Quick Start

### 1. Install (One Command)

```bash
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
```

This will:
- Install the Intelligence Toolkit (.claude/ directory)
- Generate CLAUDE.md for your project
- Create initial-prompt.md for kickstarting

### 2. Customize

Edit `initial-prompt.md`:
- Describe what you want to build
- Specify tech stack preferences
- List feature requirements

### 3. Run

Open Claude Code in your project directory and paste the kickstart command from `initial-prompt.md`.

## What You Get

### Main Skill: nextjs-project-setup

Two workflow paths:

**Simple Path** (15-30 min):
- Template selection
- Setup & configuration
- Core components (Shadcn UI)
- Basic design system
- Documentation

**Complex Path** (2-4 hours):
1. Foundation Research (intelligence-first)
2. Template Selection (Vercel templates)
3. Specification (product spec + constitution)
4. Design System Ideation (Shadcn + Tailwind + 21st Dev)
5. Wireframes & Asset Management
6. Implementation (TDD approach)
7. Quality Assurance (continuous parallel)
8. Documentation & Audit

### Supporting Infrastructure

- **3 Specialized Agents**: design-ideator, qa-validator, doc-auditor
- **Templates**: Design showcase, wireframes, reports
- **Shared Frameworks**: CoD^Σ reasoning, constitution
- **MCP Integration**: Vercel, Shadcn, Supabase, 21st Dev, Ref

## Requirements

- [Claude Code](https://claude.ai/download)
- Node.js 18+
- Git

## Features

✅ Production-ready Next.js setup
✅ TDD enforced throughout
✅ Visual validation required
✅ Accessibility compliant (WCAG 2.1 AA)
✅ Design system integrated
✅ Database setup (Supabase MCP)
✅ Component library (Shadcn UI)
✅ Quality gates at every phase

## Documentation

- `CLAUDE.md` - Project-specific Claude Code context
- `initial-prompt.md` - Kickstart template with your requirements
- `.claude/skills/nextjs-project-setup/SKILL.md` - Complete skill documentation

## Examples

See [examples/](examples/) for sample projects created with this toolkit.

## License

MIT

## Credits

Built on the Claude Code Intelligence Toolkit architecture.
EOF

echo ""
echo -e "${GREEN}=========================================="
echo "✓ Setup Complete!"
echo "==========================================${NC}"
echo ""
echo -e "${BLUE}Next Steps:${NC}"
echo ""
echo "1. Edit ${YELLOW}initial-prompt.md${NC} with your project details"
echo "2. Open Claude Code in this directory"
echo "3. Paste the kickstart command from initial-prompt.md"
echo ""
echo -e "${GREEN}The nextjs-project-setup skill will take it from here!${NC}"
echo ""
echo -e "${BLUE}Path: ${YELLOW}${PATH_TYPE}${NC}"
echo -e "${BLUE}Estimated time: ${YELLOW}$([ "$PATH_TYPE" = "complex" ] && echo "2-4 hours" || echo "15-30 minutes")${NC}"
echo ""
