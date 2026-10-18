# pcb-revision-release

PCB 设计、布局布线、验证和复盘规则，入口文件是 [`SKILL.md`](./SKILL.md)。

## 更新同步

在本地修改 `SKILL.md` 后执行：

```powershell
git add SKILL.md README.md
git commit -m "Update PCB design skill"
git push
```

仓库已配置 `post-commit` 钩子：每次提交后会自动执行 `git push`。如果网络或登录暂时失败，可手动执行：

```powershell
.\\sync.ps1
```

注意：只保存文件但没有执行 `git commit` 时，不会触发自动推送。
