# Various Configurations

## Configure your shell

Your `~/.bashrc` file should look like

```
# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

PS1="\s-\v\$"
alias vi='vim'
```

consider adding the following lines,

```
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export TZ='America/New_York'
export PGHOST=postgis1
export DB_USR={computing_id}
export DB_PWD={db_pwd}
ml git/2.4.1 anaconda/2019.10-py3.7 julia/1.3.1 gcc/7.1.0 openmpi/3.1.4 R/3.6.1
```

replacing `{computing_id}` and `{DB_PWD}` with your computing ID and the `postgres1` database password for your role.

## Configuring Git / GitHub

!!! warning

    This session assumes you have already sign-up for GitHub and added your UVA email as a verified email address. If you have not done so yet, see the GitHub session before continuing.

## Configuring an SSH key with GitHub

You add add an SSH to your GitHub account for access to GitHub (i.e., not having to input your credential every time).

To generate an SSH key in Rivanna use,

To generate a GPG key in Rivanna, from a Rivanna [shell](https://rivanna-portal.hpc.virginia.edu/pun/sys/shell/ssh/rivanna.hpc.virginia.edu) (available through the `Rivanna Shell Access` under `Clusters` tab in the dashboard).

```
ssh-keygen -t rsa -b 4096 -C "{computing_id}@virginia.edu"
```

accept the default path (e.g., `/home/{computing_id}/.ssh/*`).

You can inspect the public key by
```
cat ~/.ssh/id_rsa.pub
```

and follow the [instructions](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account) for adding the key to GitHub.

## Configuring a GPG key with GitHub

You add add a GPG to your GitHub account for signing your Git commits.

To generate a GPG key in Rivanna, from a Rivanna [shell](https://rivanna-portal.hpc.virginia.edu/pun/sys/shell/ssh/rivanna.hpc.virginia.edu) (available through the `Rivanna Shell Access` under `Clusters` tab in the dashboard).

```
ml gnupg/2.2.19
gpgconf --kill gpg-agent
gpg-agent --daemon --pinentry-program /usr/bin/pinentry
gpg --full-generate-key
```

and follow the instructions. You should use your UVA email address and select the RSA algorithm with size 4096 bits. Follow the [instructions](https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account) from GitHub on how to register the GPG key.

You can make it the default and sign all your commits with it through

```
git config --global user.signingKey {gpg-key-ID}
git config --global commit.gpgSign true
```

## ~/.gitconfig

Your `~/.gitconfig` file should now look something like

```
[user]
	email = {computing_id}@virginia.edu
	name = {Full Legal Name (based on the GPG key step)}
	signingkey = {Your GPG key ID}
[credential]
	helper = cache
[gpg]
	program = gpg
[commit]
	gpgSign = true
```

You can edit the file to match the entries if any are missing.
