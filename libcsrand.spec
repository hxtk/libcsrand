Name:	libcsrand
Version:	1.0
Release:	1%{?dist}
Summary:	Cryptographically-Secure replacement for rand()

Group:	System Enviornment/Base
License:	MIT
Source0:	https://github.com/hxtk/libcsrand/archive/main.zip

BuildArch:	x86_64

%description
This package provides a cryptographically-secure drop-in replacement for the
default C random number generator.

%prep
unzip -o %{SOURCE0}

%build
make -C libcsrand-main lib/libcsrand.a

%install
install -d %{buildroot}/usr/lib64
install -m 644 -t %{buildroot}/usr/lib64 libcsrand-main/lib/libcsrand.a

%files
%attr(0644,root,root) /usr/lib64/libcsrand.a

%changelog
* Sat Mar 6 2021 Peter Sanders <peter@psanders.me>
- Initial release
