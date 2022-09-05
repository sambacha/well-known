/**
 * @package api.response
 * @function addEventListener
 */
 addEventListener('fetch', (event) => {
    const data = {
      // @note decimal 1337 converts to hex value 539
      chaiId: '0x539',
    };
  
    const json = JSON.stringify(data, null, 2);
  
    return event.respondWith(
      new Response(json, {
        headers: {
          'content-type': 'application/json;charset=UTF-8',
        },
      })
    );
  });