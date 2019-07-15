# Alpine - Php FPM

Docker alpine php with `iconv`, `mysqli` `pdo`, `pdo_mysql`, `zip`, `gd` and `redis` installed and enabled.  
Image is based on the [`jitesoft/php`](https://gitlab.com/jitesoft/dockerfiles/php-fpm) image using PHP FPM and exposes port `9000` for FPM. If you require PHP (fpm or cli) and not the 
extensions enabled in this image, use the base image instead.



## Tags

### Docker Hub

* `7.3`, `7`, `stable`, `latest`
* `7.2`

#### Unmaintained images:

* `7.1`
* `7.0`
* `5.6`

### GitLab

* `registry.gitlab.com/jitesoft/dockerfiles/php-fpm`
  * `7.3`, `7`, `latest`, `stable`
  * `7.2`

## Dockerfile

Dockerfile can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/php-fpm) or [GitHub](https://github.com/Johannestegner/docker-php-fpm/blob/master/Dockerfile).

### Image labels

This image follows the [Jitesoft image label specification 1.0.0](https://gitlab.com/snippets/1866155).

