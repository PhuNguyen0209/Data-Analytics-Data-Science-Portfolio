from setuptools import find_packages, setup
from typing import List


def get_requirements(file_path: str) -> List[str]:
    '''
    This function will return the list of requirements
    '''
    requirements = []
    with open(file_path) as file:
        requirements = file.readlines()
        requirements = [req.replace("\n", "") for req in requirements]
        return requirements

setup(
    name="MLproject",
    version="0.0.1",
    author="Nguyen Nhu Phu",
    author_email="phunhunguyen2012@gmail.com",
    packages=find_packages(),
    install_requires=get_requirements('requirements.txt'),)
