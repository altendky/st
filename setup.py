from setuptools import setup, find_packages

setup(
    name="EPyQ_HMI",
    version="0.1",
    author="EPC Power Corp.",
    classifiers=[
        ("License :: OSI Approved :: "
         "GNU General Public License v2 or later (GPLv2+)")
    ],
    packages=find_packages(),
    entry_points={'gui_scripts': ['epyq = epyqlib.__main__:main']}
)
