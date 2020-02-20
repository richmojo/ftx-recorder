from subprocess import Popen

from config import MainConfig


if __name__ == "__main__":
    for subaccount in MainConfig["Exchange"]["subaccount"]:
        # Start a candle feed with a random port
        Popen(
            [
                "/usr/bin/python3",
                "/home/ec2-user/ftx-recorder/account_recorder.py",
                "--subaccount",
                str(subaccount),
            ],
            shell=False,
        )