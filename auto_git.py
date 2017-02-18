from sys import argv
from os import listdir, chdir
from os.path import join, abspath, isdir
from subprocess import run, CalledProcessError

directory = abspath(argv[1])
print(directory)

log = []
for r in listdir(directory):
    r_path = join(directory, r)
    if not isdir(r_path) or '.git' not in listdir(r_path) :
        continue
    print('\n\n\n********* Gitting {} ... *********'.format(r))
    chdir(r_path)
    
    try:
        run('git pull', shell=True, check=True)
        try:
            run('git add -A', shell=True, check=True)
            try:
                run('git commit -m \'Auto-sync.\'', shell=True, check=True)
                try:
                    run('git push origin master', shell=True, check=True)
                except CalledProcessError:
                    log.append('{} failed push.'.format(r))
            except CalledProcessError:
                log.append('{} failed commit.'.format(r))
        except CalledProcessError:
            log.append('{} failed add.'.format(r))
    except CalledProcessError:
        log.append('{} failed pull.'.format(r))
        
for l in log:
    print('\n*** {} ***'.format(l))