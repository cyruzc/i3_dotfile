import subprocess

# 更新系统
def update_system():
    print("正在更新系统...")
    subprocess.run(["sudo", "pacman", "-Syu"], check=True)

# 安装软件包
def install_packages(packages):
    for package in packages:
        print(f"正在安装 {package}...")
        subprocess.run(["sudo", "pacman", "-S", "--noconfirm", package], check=True)

# 清理缓存
def clean_cache():
    print("正在清理缓存...")
    subprocess.run(["sudo", "pacman", "-Scc", "--noconfirm"], check=True)

# 克隆配置文件
def clone_dotfiles(repo_url, destination):
    print(f"正在克隆配置文件仓库 {repo_url} 到 {destination}...")
    subprocess.run(["git", "clone", repo_url, destination], check=True)

def main():
    # 选择环境
    print("请选择环境：")
    print("1. i3")
    print("2. Sway")
    choice = input("请输入选项 (1 或 2): ")

    if choice == '1':
        packages = [
            "i3",
            "i3status",
            "polybar",
            "dmenu",
            "rofi",
            "feh",
            "picom",
            "git",
            "neovim",
            "htop",
            "curl",
            "wget",
            "neofetch",
            "firefox",
            "mpv",
        ]
        repo_url = "https://github.com/cyruzc/i3_dotfile.git"
        destination = "~/i3_dotfile"
    elif choice == '2':
        packages = [
            "sway",
            "swaybg",
            "swaylock",
            "waybar",
            "alacritty",
            "git",
            "neovim",
            "htop",
            "curl",
            "wget",
            "neofetch",
            "firefox",
            "mpv",
        ]
        repo_url = "https://github.com/cyruzc/sway_dotfile.git"  # 假设你有一个 Sway 的配置仓库
        destination = "~/sway_dotfile"
    else:
        print("无效的选项，程序退出。")
        return

    update_system()
    install_packages(packages)
    clean_cache()

    # 克隆配置文件
    clone_dotfiles(repo_url, destination)

    print("所有软件安装完成，配置文件已克隆！")

if __name__ == "__main__":
    main()
