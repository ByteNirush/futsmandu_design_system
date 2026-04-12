# What is `.gitignore`?

The `.gitignore` file tells Git which files and folders to **ignore** — meaning they won't be tracked, committed, or pushed to your repository.

---

## Why Do You Need It?

| Reason | Explanation |
|--------|-------------|
| **Keep repo clean** | Avoid committing auto-generated files that can be recreated |
| **Reduce size** | Don't bloat the repository with unnecessary files |
| **Prevent conflicts** | Generated files often differ between machines |
| **Protect secrets** | Keep sensitive files (API keys, credentials) out of git |
| **Faster clones** | Smaller repos are quicker to clone and work with |

---

## What's Being Ignored in This Project?

```
# Flutter/Dart specific
.dart_tool/           # Dart's build cache
.flutter-plugins      # Plugin list (auto-generated)
.flutter-plugins-dependencies
.packages             # Old package resolution file
pubspec.lock          # Locked dependency versions (for apps, keep it; for libraries, ignore)
build/                # Compiled output folder

# IDE
.idea/                # JetBrains IDE settings
.vscode/              # VS Code settings
*.iml                 # IntelliJ module files

# macOS
.DS_Store             # macOS folder metadata files

# Test coverage
coverage/             # Generated test coverage reports
```

---

## Common Rule Patterns

| Pattern | Meaning |
|---------|---------|
| `file.txt` | Ignore specific file |
| `*.log` | Ignore all `.log` files |
| `build/` | Ignore entire directory |
| `!important.log` | **Don't** ignore this file (exception) |
| `temp/*` | Ignore everything in `temp/` |

---

## When to Modify `.gitignore`

- Adding a new build tool or IDE
- Introducing secret/environment files (`.env`, `secrets.json`)
- Adding new auto-generated directories
- Switching from library to app (you'd then **keep** `pubspec.lock`)

---

## Quick Check: Is It Working?

```bash
# See ignored files that aren't tracked
git status --ignored

# Check if a specific file is ignored
git check-ignore -v filename
```

---

## Resources

- [Official Git Documentation](https://git-scm.com/docs/gitignore)
- [GitHub's .gitignore Templates](https://github.com/github/gitignore)
