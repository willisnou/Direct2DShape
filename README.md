<p align="center">
  <img src="https://github.com/willisnou/Direct2DShape/blob/master/resources/logo.png"><br>
  <code>TDirect2DShape</code> is a simply <code>TShape</code> implementation using <code>TDirect2DCanvas</code> to paint instead GDI <code>TCanvas</code>.<br>
</p>

## Instalation
`[Optional]` [**Boss**](https://github.com/HashLoad/boss) instalation:
```
boss install github.com/willisnou/Direct2DShape
```
`[Manual]` For manual installation add the `../Direct2DShape/src` directory on library path in **Tools** > **Options** > **Language** > **Delphi** > **Library** > **Library Path** AND install the component package to use in design time.

## Getting started
Just drop (at design time) the TDirect2DShape on the form and configure it. To create at runtime declare the `Direct2DShape` unit in uses clause and use the `TDirect2DShape` object.
```delphi
uses Direct2DShape;
```

## Sample code
Check out the sample code available and compare by your own.
<p align="left">
  <img src="https://github.com/willisnou/Direct2DShape/blob/master/resources/sample-project.png"><br>
</p>
