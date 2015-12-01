%define  debug_package %{nil}

Name:           start-stop-daemon
Version:        1.18.2
Release:        1%{?dist}
Summary:        Start and stop system daemon programs
Group:          System Environment/Daemons
License:        GPL2
Source:         dpkg_%{version}.tar.gz
Prefix:         %{_prefix}
Packager: 	    William Garcia
BuildRequires:  tar
BuildRequires:  make
BuildRequires:  gcc
BuildRequires:  ncurses-devel
BuildRequires:  ncurses

%description
start-stop-daemon  is  used  to control the creation and termination of
system-level  processes.   Using   one   of   the   matching   options,
start-stop-daemon  can  be  configured  to find existing instances of a
running process.

%prep
%setup -q -n dpkg-%{version}

%build
./configure
make -C lib/compat
make -C utils

%install
rm -rf $RPM_BUILD_ROOT

%{__mkdir} -p "%{buildroot}/%{_prefix}/share/man/man8"
%{__cp} -aR "man/start-stop-daemon.8" "%{buildroot}/%{_prefix}/share/man/man8/"

%{__mkdir} -p "%{buildroot}/%{_sbindir}"
%{__cp} -aR "utils/start-stop-daemon" "%{buildroot}/%{_sbindir}/start-stop-daemon"

%clean
rm -rf $RPM_BUILD_ROOT

%files
%defattr(-,root,root)
%{_prefix}/share/man/man8/start-stop-daemon.8.gz
%defattr(755,root,root)
%{_sbindir}/start-stop-daemon

%changelog
* Tue Aug 19 2015 William Garcia <garcia.rodriguez.william@gmail.com>
- Initial version
