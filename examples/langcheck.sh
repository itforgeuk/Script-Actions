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
echo "-> Python version: $PYTHONV, PIP version: $PIPV, NODEJS version: $NODEV, NPM version: $NPMV"
echo ""
echo "## END OF EXECUTION ##"
