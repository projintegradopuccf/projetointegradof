import React from 'react';

// import { Container } from './styles';

export default function MongoChart({url,width,height}) {
    return (
        <>
            <iframe 
            style={{
                border: 'none',
                borderRadius: '2px',
                boxShadow: `0 2px 10px 0 rgba(70, 76, 79, .2)`
            }} 
            width={width ? width : '640'} 
            height={height ? height : '480'}
            src={url}></iframe>

        </>
    );
}
