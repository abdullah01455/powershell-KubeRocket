🚀 KubeRocket v1

A PowerShell productivity toolkit for Kubernetes operations
Built to simplify and accelerate everyday kubectl workflows

👨‍💻 Author

Abdullah Almutaywia
📧 mutaywia@hotmail.com



<img width="778" height="933" alt="image" src="https://github.com/user-attachments/assets/86be37e5-ed62-4075-b578-6d57f8d38603" />


⚡ Overview

KubeRocket is a PowerShell automation script that provides shortcuts, aliases, and interactive functions to manage Kubernetes resources faster and easier.

Instead of long kubectl commands, KubeRocket gives you:

Simple aliases
Interactive selection menus
Fast pod/deployment/service operations
Cleaner workflow for DevOps engineers
🧠 Why KubeRocket?

Working with Kubernetes CLI can be repetitive:

kubectl get pods
kubectl describe deployment
kubectl logs pod-name

KubeRocket transforms this into:

pod
epod
lpod
dep
svc
🚀 Features
⚡ Core Alias
Set-Alias k kubectl

👉 Replace kubectl with k

📦 Pod Operations
Command	Description
pod	List pods
epod	Exec into pod
dpod	Delete pod
edpod	Edit pod
lpod	View logs
depod	Describe pod
evpod	Pod events
🏗️ Deployment Operations
Command	Description
dep	List deployments
edep	Edit deployment
ddep	Delete deployment
sdep	Scale deployment
ldep	Logs
dedep	Describe
evdep	Events
🧱 StatefulSet Operations
Command	Description
sts	List statefulsets
ests	Edit
dsts	Delete
ssts	Scale
🌐 Service Operations
Command	Description
svc	List services
esvc	Edit service
dsvc	Delete service
🌍 Ingress Operations
Command	Description
ing	List ingress
ding	Delete ingress
⚙️ ConfigMap Operations
Command	Description
cm	List configmaps
ecm	Edit
dcm	Delete
🚀 Bonus Features
🎨 KubeRocket Logo
kuberocket-logo

Displays ASCII art branding for KubeRocket CLI.

🎨 Colored Output Function

Enhances CLI readability with colored text + rocket icons 🚀

📌 Requirements
PowerShell 5+
kubectl installed
Active Kubernetes cluster context
📦 Installation
# Load script
. .\kuberocket.ps1

Or add to PowerShell profile:

notepad $PROFILE
⚡ Example Workflow
pod
epod
lpod
sdep
svc
ing
🧠 Philosophy

“Less typing, more control.”

KubeRocket is designed to make Kubernetes feel like a native CLI experience inside PowerShell.

🔥 Future Improvements
Search by name instead of index
Auto-completion support
Namespace switching menu
Filter + fuzzy search
YAML generator for resources
🛡️ Disclaimer

This tool is for productivity purposes and wraps standard kubectl commands without modifying Kubernetes core behavior.

⭐ Star if you like it

If this project helps your workflow, give it a ⭐ on GitHub.
