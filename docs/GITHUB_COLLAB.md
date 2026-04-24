# Working Together With GitHub

Use GitHub like a shared checkpoint system.

## Daily Flow

Before coding:

```powershell
git pull
```

After a small working change:

```powershell
git status
git add .
git commit -m "Add academy joke command"
git push
```

Then the other computer runs:

```powershell
git pull
```

## Simple Team Rules

- Work on one tiny change at a time.
- Say what file you are changing before both people edit at once.
- Commit when Minecraft runs or the project builds.
- Use clear commit messages: `Change hello message`, `Add quest command`, `Fix typo`.
- If Git says there is a conflict, stop and solve it together.

## Easy Branch Option

For the first few sessions, both of you can commit to `main`.

When you are ready to learn pull requests:

```powershell
git switch -c add-new-command
git push -u origin add-new-command
```

Then open a pull request on GitHub and review it together.
