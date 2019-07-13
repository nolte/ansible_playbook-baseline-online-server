
import pytest
import testinfra

def test_os_release(host):
    assert host.file("/etc/os-release").contains("CentOS")
