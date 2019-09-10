#!/usr/bin/python
import argparse
import os
import pathlib
import subprocess

def extractors(suffix):
    data = {'.tar.gz': ['tar', '-xvf']}
    return data.get(suffix, ['7z', 'x'])

def is_valid_file(parser, arg):
    if not os.path.exists(arg):
        parser.error('File %s does not exist!' % arg)

    if not len(pathlib.Path(arg).suffixes):
        parser.error('File %s has no suffix.' % arg)

    return arg

class Extractor:
    def __init__(self):
        parser = argparse.ArgumentParser(description='Process file by extension.')
        parser.add_argument('file', metavar='FILE', type=lambda x: is_valid_file(parser, x), nargs=1, help='file to extract')

        self.args = parser.parse_args()

    def parse_extension(self):
        file_path = self.args.file[0]
        suffixes = pathlib.Path(file_path).suffixes
        suffix = ''.join(suffixes[-2:])
        self.extract(file_path, suffix)

    def extract(self, file_path, suffix):
        extractor = extractors(suffix) + [file_path]
        p = subprocess.Popen(extractor)
        p.communicate()


if __name__ == '__main__':
    e = Extractor()
    e.parse_extension()

