import argparse
from .plot import plot_quadratic


def run():
    
    # Parse the command line arguments to get the quadratic parameters
    parser = argparse.ArgumentParser(description='Plot a quadratic function y = ax^2 + bx + c')
    parser.add_argument('-a', type=float, help='a')
    parser.add_argument('-b', type=float, help='b')
    parser.add_argument('-c', type=float, help='c')
    parser.add_argument('--xrange', '-x', nargs=2, type=float, help='x range to calculate y over')
    args = parser.parse_args()

    # Pass these parameters to the function to plot the quadratic
    plot_quadratic(a=args.a,
                   b=args.b,
                   c=args.c,
                   x_min=args.xrange[0],
                   x_max=args.xrange[1],
                   N=1000)
