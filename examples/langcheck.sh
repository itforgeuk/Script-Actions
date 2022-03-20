echo "==================================="
echo "==    Python/NodeJS example     ==="
echo "==       Check versions         ==="
echo "==================================="
sleep 1

PYTHONV=$(python --version)
PIPV=$(pip --version)
NODEV=$(node --version)
NPMV=$(npm --version)
echo ""
echo -e "-> Python version: $PYTHONV\n-> PIP version: $PIPV\n-> NODEJS version: $NODEV\n-> NPM version: $NPMV"
echo ""
echo "## END OF EXECUTION ##"
