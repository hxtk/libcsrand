Name:	libcsrand
Version:	1.0
Release:	1%{?dist}
Summary:	Cryptographically-Secure replacement for rand()

Group:	System Enviornment/Base
License:	MIT
Source0:	https://github.com/hxtk/libcsrand/archive/%{VERSION}-release.tar.gz

BuildArch:	x86_64

%description
This package provides a cryptographically-secure drop-in replacement for the
default C random number generator.

%prep
tar -xzf %{SOURCE0} --strip-components=1

%build
make lib/libcsrand.a

%install
install -d %{buildroot}%{_libdir}
install -m 644 -t %{buildroot}%{_libdir} lib/libcsrand.a

%files
%attr(0644,root,root) %{_libdir}/libcsrand.a

%changelog
* Sat Mar 6 2021 Peter Sanders <peter@psanders.me>
- Initial release
