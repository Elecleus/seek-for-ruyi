Name:           {{ name }}
Version:        {{ version }}
Release:        {{ release }}
Summary:        {{ output_main.summary }}
License:        {{ license }}
URL:            {{ url }}
VCS:            {{ vcs }}
{% for source in sources %}
Source{{ loop.index }}:        {{ source.url }}
{% endfor %}
BuildSystem:    {{ build_system }}

BuildRequires:  {{ output_main.build_requires }}
Requires:       {{ output_main.requires }}

%description
{{ output_main.description }}

{% for output in output_others %}
%package        {{ output.name }}
Summary:        {{ output.summary }}
Requires:       {{ output.requires }}
BuildRequires:  {{ output.build_requires }}

%description    {{ output.name }}
{{output.description}}
{% endfor %}

### %package        devel
### Summary:        Development files for GTK+
### Requires:       %{name}%{?_isa} = %{version}-%{release}
###
### %description    devel
### Development files for GTK+.
###
### %if %{with tests}
### %package        tests
### Summary:        Tests for the %{name} package
### Requires:       %{name}%{?_isa} = %{version}-%{release}
###
### %description    tests
### Tests for gtk3.
### %endif

{% for build_step in build_steps %}
%build -a
{{ build_step.environment }}
{{ build_step.script }}
{% endfor %}

### %install -a
### touch %{buildroot}%{_libdir}/gtk-3.0/%{bin_version}/immodules.cache
### mkdir -p %{buildroot}%{_sysconfdir}/gtk-3.0
### mkdir -p %{buildroot}%{_libdir}/gtk-3.0/modules
### mkdir -p %{buildroot}%{_libdir}/gtk-3.0/immodules
###
### # TODO: fix the name error.
### # Avoid illegal package names
### rm -rf $RPM_BUILD_ROOT%{_datadir}/locale/*@*
### %find_lang gtk30 --all-name --generate-subpackages
###
### %check
### desktop-file-validate %{buildroot}%{_datadir}/applications/*.desktop
### %if %{with tests}
### %meson_test
### %endif
###
### %transfiletriggerin -- %{_libdir}/gtk-3.0/3.0.0/immodules
### %{_bindir}/gtk-query-immodules-3.0 --update-cache &>/dev/null || :
###
### %transfiletriggerpostun -- %{_libdir}/gtk-3.0/3.0.0/immodules
### %{_bindir}/gtk-query-immodules-3.0 --update-cache &>/dev/null || :

%files
{{ output_main.files }}

{% for output in output_others %}
%files {{ output.name }}
{{ output.files }}
{% endfor %}

### %files devel
### %{_libdir}/lib*.so
### %{_includedir}/gail-3.0/
### %{_includedir}/gtk-3.0/
### %{_datadir}/aclocal/gtk-3.0.m4
### %{_libdir}/pkgconfig/g*-3.0.pc
### %{_bindir}/gtk3-*
### %{_bindir}/gtk-builder-tool
### %{_bindir}/gtk-encode-symbolic-svg
### %{_bindir}/gtk-query-settings
### %{_datadir}/applications/*.desktop
### %{_datadir}/icons/hicolor/*/apps/*.png
### %{_datadir}/gettext/
### %{_datadir}/gir-1.0
### %{_datadir}/gtk-3.0/gtkbuilder.rng
### %{_datadir}/gtk-3.0/valgrind/
### %{_libdir}/gtk-3.0/%{bin_version}/immodules/im-xim.so
###
### %if %{with tests}
### %files tests
### %{_libexecdir}/installed-tests/
### %{_datadir}/installed-tests/
### %endif

%changelog
{% if let Some(changelog) = changelog %}
{{ changelog }}
{% else %}
%{?autochangelog}
{% endif %}
