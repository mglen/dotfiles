import os


skipd = ['.git/']
skipf = ['README.md','desired_commands','setup.py','setup.sh','setup2.sh']

home_dir = os.path.expanduser('~')
backup_dir = os.path.join(home_dir, 'old_dotfiles')

matches = []
for root, dirnames, filenames in os.walk('.'):
    if any([root.startswith('./'+dname) for dname in skipd]):
        continue
    for d in dirnames:
        homed = os.path.join(home_dir, d)
        try:
            os.mkdir(homed)
        except OSError as e:
            if e.errno != 17:
                raise e

    for f in filenames:
        if any([f == fname for fname in skipf]):
            continue
        homef = os.path.join(home_dir, f)
        if os.path.isfile(homef) && not os.path.islink(homef):
            print "Moving %s to backup dir" % homef
            os.rename(homef, os.path.join(backup_dir, f))
        os.symlink(f, homef)


    print dirnames
    print filenames
