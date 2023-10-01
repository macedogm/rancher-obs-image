FROM registry.opensuse.org/opensuse/tumbleweed:latest

RUN zypper -n up

RUN zypper -n in git-core \
                 python311-packaging \
                 obs-service-go_modules \
                 obs-service-recompress \
                 obs-service-set_version \
                 obs-service-tar_scm \
                 osc

RUN zypper ar https://cli.github.com/packages/rpm/gh-cli.repo && \
    zypper --gpg-auto-import-keys ref && \
    zypper -n in gh

RUN  zypper clean -a && \
     rm -rf /tmp/* /var/tmp/* /usr/share/doc/packages/* /usr/share/doc/manual/* /var/log/*
