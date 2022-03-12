clear

# Environment ----------------------------------------------

# set env vars for current shell and all processes started from current shell.
export MANDSENV="testing"
export DATABASE_URL="postgresql://mands_user:mands_pw@localhost:5432/mands_db?sslmode=disable"

# Correct directory?
if  [ ! -f "./app/__init__.py" ]
then
    echo "You are not in the correct directory. Navigate to mands/server/"
    exit 1
fi

# Correct Python environment?
if  [ ! -d "./env" ]
then
    echo "Did not find an virtual environment for Python under ./env/"
    exit 1
fi

# Source python environment
source env/bin/activate
py_interpreter=$(which python)
echo "Running Python from: $py_interpreter"


# Correctness ---------------------------------------------

python3 -m mypy app/
if [ $? -eq 1 ]
then
    echo "MyPy found something."
    exit 1
fi


# Style ---------------------------------------------------

python3 -m black app/

python3 -m isort app/ --profile black

python3 -m flake8 app/

if [ $? -eq 1 ]
then
    exit 1
fi


# Security ------------------------------------------------

bandit -r app/  --configfile bandit.yaml


# Test ----------------------------------------------------

python3 -m pytest --cov app/

if [ $? -eq 1 ]
then
    exit 1
fi