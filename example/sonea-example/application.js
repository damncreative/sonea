module.exports = {
    
    apps: [
        'sonea-admin', // no need a path -> will be required
        {
            app: './sonea-example-app', // relative from root or absolute
            as: 'ExampleApp' // default is capitalized camelcase name from manifest (package.json)
        }
    ],
    
    // extensions - like security
    extension: [
        //'cors',
        //'csrf'
    ],
    
    // global middlewares - for all applications
    // every application can have their one
    
    // every application use this default order as base
    // do not forget - every middleware has event hooks - before and after
    // except errors -> has only a before hook - because errors are render
    // something whatever comes
    middlewares: [
        'cookie-parser',
        'express-session',
        'body-parser',
        'method-override',
        
        // custom global middlewares
        '$custom',
        
        // custom app specific middlewares
        '$apps',
        
        // sonea favicon loader - favicon can be overwritten per app
        'favicon',
        
        // error handler
        'errors'
    ]
    
    // there are many more options...but not explained here
};