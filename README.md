
![requirements txt](https://github.com/user-attachments/assets/1f8b6a87-c224-4f93-9633-6e3a16c92676)
Prerequisite: You need a ComfyUI environment with VENV properly prepared.
This is an altar where to sacrifice copies of requirements.txt from inside ComfyUI/Custom_Nodes/YourBrokenNode whereas you will copy the .txt file besides the .bat file and it will get deleted, but not before installing the dependencies of the said broken node in the activated and later deactivated conda virtual environment.
Venv ensures that your ComfyUI have its dependencies installed locally rather than system-wide which prevents conflicts.

Here's the directory structure:
Your ComfyUI folder is located somewhere like D:\AI\ComfyV1\ComfyUI\main.py (main.py is an anchored value that we can rely and agree on)
YourDrive:\YourWorkspace\YourInstancename\TheComfyFolderYouGitClonedOrPortableExtracted\main.py would be a fine metarepresentation of your path.
Your RequirementsALTAR folder should be in YourDrive:\YourWorkspace\YourInstancename\ or to make it more readable, D:\AI\ComfyV1\ whereas D: and \AI and \ComfyV1 are volatile values, but ComfyUI is an anchor value, a sure bet, and it should be side by side by RequirementsALTAR, another anchor value which is case-sensitive and requires being placed at the correct spot. 
So, RequirementsALTAR is side by side with ComfyUI
Venv is undeniably required by this script to be located at \ComfyUI\Venv\, unless edited for your own courtesy in a situation wehre you would have installed VENV in \env\ or \.venv\ instead of \venv\.
D:\YourWorkspace\InstanceName\
D:\YourWorkspace\InstanceName\ComfyUI\Venv\
D:\YourWorkspace\InstanceName\ComfyUI\
D:\YourWorkspace\InstanceName\RequirementsALTAR\
D:\YourWorkspace\InstanceName\RequirementsALTAR\ALTAR.bat
D:\YourWorkspace\InstanceName\RequirementsALTAR\Requirements.txt
so you'd ```git clone https://github.com/cheesecakejohnsonturbo/RequirementsALTAR/``` in D:\YourWorkspace\InstanceName\ in order to have all things set.
`Brams is a good man. Brams only sacrifices straw dummy requirements.txt but never sacrifices the original file.`
