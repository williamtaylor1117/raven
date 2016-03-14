var raven = angular.module('raven', ['ui.router']);

raven.config(function ($stateProvider, $locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });

    $stateProvider
        .state('landing', {
            url: '/',
            controller: 'Landing.controller',
            templateUrl: '/templates/landing.html'
        })
        .state('analyze', {
            url: '/analyze',
            controller: 'Analyze.controller',
            templateUrl: '/templates/analyze.html'
        })
        .state('contact', {
            url: '/contact',
            controller: 'Contact.controller',
            templateUrl: '/templates/contact.html'
        })
        .state('result', {
            url: '/result',
            controller: 'Result.controller',
            templateUrl: '/templates/result.html'
        })
        .state('viz', {
            url: '/viz',
            controller: 'Viz.controller',
            templateUrl: '/templates/viz.html'
        });
});
