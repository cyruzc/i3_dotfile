import subprocess
import os

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
    if os.path.exists(destination):
        print(f"{destination} 已存在，正在删除...")
        subprocess.run(["rm", "-rf", destination], check=True)
    subprocess.run(["git", "clone", repo_url, destination], check=True)

def main():
    # 选择环境
    print("请选择环境：")
    print("1. i3")
    print("2. Sway")
    print("3. HyprLand")
    choice = input("请输入选项 (1 或 2 或 3): ")
    repo_url = "https://github.com/cyruz/i3_dotfile"
    destination = os.path.expanduser("~/.config/dotfile")

    # 根据选择设置包和目标路径
    if choice == '1':
        packages = [
            "i3",
            "i3status",
            "polybar",
            "dmenu",
            "rofi",
            "feh",
            "picom",
        ]
    elif choice == '2':
        packages = [
            "sway",
            "swaybg",
            "swaylock",
            "waybar",
            "alacritty",
        ]
    elif choice == '3':
        packages = [
            "hyprland",
            "hyprpaper",
            "waybar",
        ]
        repo_url += "/hypr_config.git"
    else:
        print("无效的选项，程序退出。")
        return

    # 普通包
    common_packages = [
        "git",
        "alacritty",
        "neovim",
        "htop",
        "curl",
        "wget",
        "unzip",
        "neofetch",
        "firefox",
        "mpv",
    ]

    update_system()
    install_packages(packages + common_packages)
    clean_cache()

    # 克隆配置文件
    clone_dotfiles(repo_url, destination)

    print("所有软件安装完成，配置文件已克隆！请根据需要进行进一步的配置。")

if __name__ == "__main__":
    main()
