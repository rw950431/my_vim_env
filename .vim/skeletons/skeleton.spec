Summary: .
Name: 
Version: 
Release: 
#Epoch: 1
License: GPL
Group: 
Source0: 
Source1: 
Patch0: 
Patch1: 
URL: 
BuildRoot:  %{_builddir}/%{name}-%{version}-%{release}-root
Requires: /sbin/ldconfig

%description

%prep
%setup -q

%build
%configure
make

%install
rm -rf %{buildroot}
%makeinstall

%clean
rm -rf %{buildroot}

%post -p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(-, root, root)
%doc AUTHORS COPYING ChangeLog NEWS README TODO
%{_bindir}/*
%{_libdir}/*.so.*
%{_datadir}/%{name}
%{_mandir}/man8/*

%files devel
%defattr(-, root, root)
%doc HACKING
%{_libdir}/*.a
%{_libdir}/*.la
%{_libdir}/*.so
%{_mandir}/man3/*

%changelog
* Mon Jan 14 2002 Matthias Saou 
- Initial RPM release.
