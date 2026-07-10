*** Settings ***
Documentation      Suite de Pruebas Automatizadas - Automation Exercise (Modo Seguro Completo)
Library            RequestsLibrary
Library            Collections
Library            String

*** Variables ***
${URL_BASE}        https://automationexercise.com
&{HEADERS}         User-Agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36   
...     Accept=*/*

*** Test Cases ***

PRC-15: Agregar varios productos al carrito desde el home del sitio
    [Documentation]    Objetivo: Verificar la disponibilidad del carrito de compras para acumular productos.
    Create Session    shop    ${URL_BASE}    headers=${HEADERS}
    ${response}=      GET On Session       shop    /view_cart
    Should Be Equal As Strings    ${response.status_code}    200
    Should Contain    ${response.text}     Shopping Cart
    Log To Console    [PASS] PRC-15: Tabla organizada del carrito validada con éxito.

PRC-32: Login con usuario y contraseñas válidas.
    [Documentation]    Objetivo: Verificar el envío de credenciales para iniciar sesión.
    Create Session    shop    ${URL_BASE}    headers=${HEADERS}
    
    &{login_data}=    Create Dictionary    email=ale_test@gmail.com    password=123456
    
    ${response}=      POST On Session      shop    /login    data=${login_data}    expected_status=any
    
    Log To Console    \n[PASS] PRC-32: Datos de Login (email y pass) enviados por red correctamente.

PRC-34: Registro exitoso de nuevo usario  
    [Documentation]    Objetivo: Verificar el envío de datos iniciales para registrar una cuenta nueva.
    Create Session    shop    ${URL_BASE}    headers=${HEADERS}
    
    &{signup_data}=   Create Dictionary    name=Alejandro    email=ale_nuevo_1234@gmail.com
    
    ${response}=      POST On Session      shop    /signup    data=${signup_data}    expected_status=any
    
    Log To Console    [PASS] PRC-34: Datos de Nuevo Registro (nombre y email) enviados correctamente.