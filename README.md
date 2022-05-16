# Drupal and CypressIO

## Add end to end tests in 20 minutes with CypressIO

* [Slides](https://docs.google.com/presentation/d/1KunnazV_joHNLTrvfIi8iOMFnUnkwQcOMDOx6sYWe7Y/edit?usp=sharing)
* [Blank site](https://github.com/fjgarlin/drupalcon-barcelona-2020/blob/master/blank-site.sh)
* [D7 site](https://github.com/fjgarlin/drupalcon-barcelona-2020/blob/master/d7-site.sh)
* [D8 site](https://github.com/fjgarlin/drupalcon-barcelona-2020/blob/master/d8-site.sh)

## Run the examples

The provided scripts will run all the necessary commands to build the code used on the slides.
It assumes that some tools like `php`, `npm`, `composer`... are installed.

Some scripts require sudo just to delete the generated folders as Drupal marks them as read-only after install.

* Example one: `./blank-site.sh`
* Example two: `./d7-site.sh` (requires [pygmy](https://pygmy.readthedocs.io/en/master/))
* Example three: `./d8-site.sh`
* Clean up generated files: `./clean-up.sh`
