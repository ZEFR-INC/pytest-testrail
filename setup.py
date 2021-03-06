from setuptools import setup

long_description = open("README.rst").read()

setup(
    name='pytest-testrail',
    description='pytest plugin for creating TestRail runs & adding results',
    long_description=long_description,
    version='0.0.14',
    author='Data-Test',
    author_email='data-test@zefr.com',
    url='https://github.com/ZEFR-INC/pytest-testrail',
    packages=[
        'pytest_testrail',
    ],
    package_dir={'pytest_testrail': 'pytest_testrail'},
    install_requires=[
        'pytest>=2',
        'configparser>=3,<4',
        'requests>=2.11.1',
        'simplejson'
    ],
    include_package_data=True,
    entry_points={'pytest11': ['pytest-testrail = pytest_testrail.conftest']},
)
