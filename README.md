
# URL Shortener Web Application

## Description
URL Shortener Web Application is a user-friendly web-based tool that allows users to create shortened versions of long URLs, making them easier to share. This project is built using the MERN stack (MongoDB, Express, React, Node.js) and styled with Chakra UI for a visually appealing and responsive user interface.

## Features
- Shorten URLs: Convert long URLs into shortened versions with a single click.
- Custom Short URLs (Optional): Create personalized and memorable links for your URLs.
- Copy to Clipboard: Copy the shortened URL to the clipboard for easy sharing.
- User-friendly Interface: Intuitive and responsive UI design for a seamless user experience.

## Demo
![URL Shortener Demo](https://github.com/Akshay-Singh-Rajput/MERN-Stack-URL-Shortener/assets/97354310/8e5a29d2-1477-486d-bd9c-b9292fe8d224)

## Live Demo
Try out the live demo of the URL Shortener Web Application [here](https://lightlink.vercel.app).

## Installation
To run the URL Shortener Web Application locally, follow these steps:

1. Clone the repository:

2. Install dependencies for both frontend and backend:
   
```cd server```
```npm install```
```cd client```
```npm install```

4. Set up environment variables:
- Create a `.env` file in the root directory and add the following:
  ```
  MONGODB_URI=your-mongodb-uri
  PORT=your-port-number
  ```

4. Start the development server:

  -Server ```npm start```
  -Client ```npm run dev```

The URL Shortener Web Application will be running on `http://localhost:your-port-number`.

## 🚀 To run the application on GCP Cloud, follow these steps:

🧱 Part 1: Create a GCP VM
- VM Type: e2-medium or better

🔥 Part 2: Configure Firewall
- ✅ Allow HTTP & HTTPS traffic during VM creation

🛠️ Part 3: Install Jenkins

1. Update & install dependencies:
    sudo apt update && sudo apt upgrade -y
    sudo apt install openjdk-17-jdk -y

2. Add Jenkins repository:
    curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
      /usr/share/keyrings/jenkins-keyring.asc > /dev/null

    echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
      https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
      /etc/apt/sources.list.d/jenkins.list > /dev/null

3. Install Jenkins:
    sudo apt update
    sudo apt install jenkins -y

4. Start Jenkins:
    sudo systemctl enable jenkins
    sudo systemctl start jenkins

🌐 Part 4: Access Jenkins Web UI
- Get your VM's external IP from the GCP console.
- Visit: http://<EXTERNAL_IP>:8080

🔓 Part 5: Unlock Jenkins
    sudo cat /var/lib/jenkins/secrets/initialAdminPassword
- Paste the password into the web UI to unlock Jenkins.

🧩 Part 6: Install Recommended Plugins
- On first login, Jenkins asks for plugin installation — select "Install suggested plugins".
- Create your first admin user after plugins install.

🔧 Part 7: Install Additional Tools

Docker:
    sudo apt install docker.io -y
    sudo usermod -aG docker jenkins
    sudo systemctl restart docker
    sudo systemctl restart jenkins

Google Cloud SDK:
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | \
    sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list

    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | \
    sudo apt-key add -

    sudo apt update && sudo apt install google-cloud-sdk -y

kubectl:
    sudo apt install kubectl -y

🔐 Part 8: Add Service Account Key for GKE
1. Create a service account in IAM:
   - Roles: Kubernetes Admin, Viewer, Storage Admin, etc.
2. Download JSON key.
3. In Jenkins:
   - Go to: Manage Jenkins → Credentials → Global → Add Credentials
   - Type: Secret file
   - Upload the JSON key
   - ID: gcp-creds

🔁 Final Steps
- Reboot the VM or restart Jenkins:
    sudo systemctl restart jenkins

📦 Usage
- Access the application at http://localhost:your-port-number in your web browser.
- Enter the long URL you want to shorten in the input field.
- Optionally, provide a custom short URL code.
- Click the "Shorten URL" button to generate the shortened version.
- The shortened URL will be displayed and copied to your clipboard.

🧰 Technologies Used

Frontend:
- React
- Chakra UI
- React Router
- Axios

Backend:
- Node.js
- Express
- MongoDB (via Mongoose)

Containerization:
- Docker
- Kubernetes

Infrastructure as Code:
- Terraform

CI/CD:
- Jenkins
- GitHub Actions

Deployment:
- Backend: Deployed on Render
- Frontend: Deployed on Vercelil or connect with me on LinkedIn.
