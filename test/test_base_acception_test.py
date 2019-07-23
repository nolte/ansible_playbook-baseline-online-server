import pytest


def test_os_release(host):
    assert host.file("/etc/os-release").contains("CentOS")


@pytest.mark.parametrize(
    "command,expected_version",
    [
        ("/usr/local/bin/restic version", "restic 0.9.5"),
        ("python3.6 --version", "Python 3.6"),
    ],
)
def test_command_output_like_expected(command, expected_version, host):
    successfull = False
    with host.sudo("root"):
        command_out = host.check_output(command)
        assert command_out.startswith(expected_version)
        successfull = True

    assert successfull


@pytest.fixture
def pip_packages(host):
    return host.pip_package.get_packages()


@pytest.mark.parametrize("package,version", [("boto3", "1.9"), ("botocore", "1.12")])
def test_pip_packages_installed(package, version, pip_packages):
    assert pip_packages.get(package).get("version").startswith(version)
