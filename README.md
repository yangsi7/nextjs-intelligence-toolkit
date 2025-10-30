# Next.js Intelligence Toolkit

**One-command setup for production-ready Next.js projects powered by Claude Code.**

Featuring the **nextjs-project-setup skill** - your AI pair programmer for Next.js development.

---

## 🚀 Quick Start (30 seconds)

```bash
# In your project directory
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
```

The script will ask you a few questions, then:
✅ Install the Intelligence Toolkit
✅ Generate `CLAUDE.md` for your project
✅ Create `initial-prompt.md` with kickstart command

---

## 📋 What You Get

### Main Product: nextjs-project-setup Skill

A comprehensive Next.js project setup workflow with two paths:

#### Simple Path (15-30 min)
Perfect for blogs, portfolios, marketing sites:
1. **Template Selection** - Choose from Vercel's templates
2. **Setup & Config** - Install dependencies, configure env
3. **Core Components** - Add Shadcn UI components
4. **Basic Design** - Tailwind config with CSS variables
5. **Documentation** - README + CLAUDE.md

#### Complex Path (2-4 hours)
For SaaS, e-commerce, multi-tenant apps:
1. **Foundation Research** - Intelligence-first discovery (global skills + MCP)
2. **Template Selection** - Analyze requirements, choose best fit
3. **Specification** - Product spec + constitutional framework
4. **Design System** - Ideate with 21st Dev MCP, customize Shadcn
5. **Wireframes** - Generate layouts, manage assets
6. **Implementation** - TDD approach, parallel features
7. **Quality Assurance** - Continuous validation, accessibility checks
8. **Documentation** - Comprehensive docs + audit

### Supporting Cast

**3 Specialized Agents:**
- `design-ideator` - Create design system options (color, typography, components)
- `qa-validator` - Continuous quality validation (tests, accessibility, performance)
- `doc-auditor` - Documentation completeness and consistency

**Templates:**
- Design showcases, wireframes, reports, verification checklists

**Frameworks:**
- CoD^Σ (Chain of Density Sigma) - Evidence-based reasoning
- Constitution - Development principles and quality gates

**MCP Integration:**
- **Vercel MCP** - Template discovery
- **Shadcn MCP** - Component library (critical workflow: Search → View → Example → Install)
- **Supabase MCP** - Database and auth setup
- **21st Dev MCP** - Design ideation and inspiration
- **Ref MCP** - Library documentation (Next.js, React, TypeScript)

---

## 🎯 How It Works

### 1. Install
```bash
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
```

Interactive prompts:
- Project name?
- Project type? (Simple | Complex SaaS | E-commerce | Custom)
- Database? Auth? Multi-tenant?

### 2. Customize

Edit `initial-prompt.md`:
```markdown
## What I Want to Build
A SaaS platform for project management with real-time collaboration...

## Complexity Indicators
- [X] Database required
- [X] Authentication needed
- [X] Multi-tenant architecture
- [ ] E-commerce features

## Tech Stack Preferences
- Database: Supabase (PostgreSQL)
- Authentication: Supabase Auth (Email + Google OAuth)
- Styling: Tailwind CSS with custom brand colors
...

## Kickstart Command
Use the nextjs-project-setup skill to create a Complex SaaS Next.js project based on @initial-prompt.md...
```

### 3. Run

Open Claude Code, paste the kickstart command:

```
Use the nextjs-project-setup skill to create a Complex SaaS Next.js project based on @initial-prompt.md.

Project name: my-saas-app
Recommended path: complex

Execute all 8 phases...
```

Claude takes it from there! 🎉

---

## 💡 Key Features

### Intelligence-First Architecture
- **80%+ token savings** - Query project-intel.mjs + MCP tools before reading files
- **Global skills integration** - Leverages 3,316 lines of curated knowledge (shadcn-ui, nextjs, tailwindcss)
- **Progressive disclosure** - Load only what's needed, when needed

### Quality by Default
- **TDD enforced** - Tests before implementation, no exceptions
- **Visual validation required** - Every page/component reviewed
- **Accessibility compliant** - WCAG 2.1 AA minimum
- **CoD^Σ reasoning** - All decisions traced to evidence (file:line references)

### Developer Experience
- **Complexity assessment** - Auto-detect simple vs complex, confirm with user
- **User feedback loops** - Design and wireframes iterate with your input (max 3 iterations)
- **Rollback procedures** - Every phase documented with recovery steps
- **Progress indicators** - Visual bars show workflow progress

### Token Efficiency
- **Phase 1 optimization** - 8,000 → 1,500 tokens (81% reduction via global skills)
- **Agent truncation** - Reports capped at 2,500 tokens with continuation protocol
- **Import depth limits** - Max 5 levels prevents cascading bloat
- **Report cleanup** - Keep last 5 per type, auto-delete older

---

## 📖 Examples

### Simple Blog
```bash
# Install
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
# Choose: 1) Simple, No database, No auth

# Kickstart
"Use the nextjs-project-setup skill for a simple Next.js blog. Follow the simple path."

# Result: Blog Starter Kit template, Shadcn UI, basic design, ready in 20 min
```

### Complex SaaS
```bash
# Install
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
# Choose: 2) Complex SaaS, Yes database, Yes auth, Yes multi-tenant

# Edit initial-prompt.md with features, then kickstart
"Use the nextjs-project-setup skill to create a Complex SaaS Next.js project based on @initial-prompt.md..."

# Result: Full-featured SaaS with Supabase, auth, design system, TDD tests, ready in 3 hours
```

---

## 🛠️ Requirements

- **Claude Code** - [Download here](https://claude.ai/download)
- **Node.js 18+** - For Next.js
- **Git** - For version control

Optional but recommended:
- **Supabase account** - For database projects
- **Vercel account** - For deployment

---

## 📚 Documentation

After installation, see:

- **`CLAUDE.md`** - Project-specific Claude Code context
- **`initial-prompt.md`** - Kickstart template with your requirements
- **`.claude/skills/nextjs-project-setup/SKILL.md`** - Complete skill documentation (999 lines)
- **`.claude/skills/nextjs-project-setup/docs/`** - Phase-specific guides

For toolkit architecture:
- **`docs/claude-code-comprehensive-guide.md`** - Building Claude Code components (1,450 lines)
- **`.claude/shared-imports/constitution.md`** - Development principles (7 articles)

---

## 🤝 Contributing

This toolkit is designed for customization:

1. **Add skills** - Create `.claude/skills/your-skill/SKILL.md`
2. **Add agents** - Create `.claude/agents/your-agent.md`
3. **Add templates** - Create `.claude/templates/your-template.md`
4. **Customize workflows** - Edit existing skills to fit your team's needs

Share your improvements! Fork, customize, submit PRs.

---

## 📄 License

MIT License - Use freely, commercially or personally.

---

## 🙏 Credits

Built on the **Claude Code Intelligence Toolkit** architecture.

Core innovation:
- **Intelligence-first** - Query before read (80%+ token savings)
- **Skills-first hierarchy** - Auto-invoke domain expertise
- **CoD^Σ reasoning** - Evidence-based decisions
- **Progressive delivery** - Test each story independently

Powered by:
- Claude 4.5 Sonnet (main orchestrator)
- MCP (Model Context Protocol) for external integrations
- Next.js 14+ (App Router)
- Tailwind CSS + Shadcn UI

---

## 🔗 Links

- **GitHub**: [nextjs-intelligence-toolkit](https://github.com/yangsi7/nextjs-intelligence-toolkit)
- **Installation**: `curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash`
- **Claude Code**: https://claude.ai/download
- **Issues**: https://github.com/yangsi7/nextjs-intelligence-toolkit/issues

---

**Ready to build production-ready Next.js apps with AI?**

```bash
curl -fsSL https://raw.githubusercontent.com/yangsi7/nextjs-intelligence-toolkit/master/setup.sh | bash
```

🚀 **Let Claude Code handle the setup. You focus on building.**
