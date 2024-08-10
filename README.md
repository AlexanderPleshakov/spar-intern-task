### Тестовое задание в 1221Systems на должность Стажера-программиста iOS на проект по разработке мобильного приложения "Мой SPAR"

Реализовать экран списка товаров из дизайна по ссылке:
https://www.figma.com/design/1VrYJ62cSC7yFJWsuUD3xa/Spar-Intern-Task?node-id=0-1&t=SuQD6RjUqoX4pPUF-1

Для отображения данных используем МОК-модельки
Для реализации тестового задания используем фреймворк SwiftUI. Архитектурный паттерн MVVM

Экраны:
Будет один экран в двух состояниях:

1. Экран списка товаров в режиме отображения Grid
2. Экран списка товаров в режиме отображения List

Примечание: Цвета и картинки берем из макета Figma, шрифты можно использовать системные. 
Код необходимо предоставить в виде ссылки на репозиторий в github

Будет плюсом реализовать локальное добавление в корзину. 


### Детали проведенной работы

###### Переключение состояний
Чтобы реализовать переключение состояний, было необходимо добавить кнопку переключения состояний в navaigationb bar, как в Figma. При клике на кнопку она анимировано смещается в соответсвии с дизайном, и меняется режим отображения. 
Для добавления разделительной линии было необходимо изменить bar appearance, это реализовано в файле NavigationBarAppearance.swift.

Для смены сосотояний я добавил enum MarketLayoutState, который имеет два кейса grid и list. MarketViewModel меняет это состояние при клике по кнопке, в следствие чего в MarketScreen меняется view для отрисовки.

Для реализации Grid и List состояния был использован LazyVGrid. В случае с Grid состоянием использовалось два столбца, в случае с List один.

###### Ячейки и модели
Для Grid была создана ячейка ProductGridCell
Для List была создана ячейка ProductListCell.
Они используют те же самые view, находящиеся в папке MarketCellSubviews. Также используют одну и ту же вью модель MarketCellViewModel, которая принимает в инициализаторе модель Product.

Для некоторых сложных view были добавлены еще вью модели UnitPickerViewModel, PriceAndBuyViewModel.

###### Добавление в карзину

Для иметации добавления в корзину служит сервис Storage(), который просто сохраняет данные в UserDefaults. Да, UserDefaults не хорошее решения для хранения больших данных, но в качестве теста на моковых моделях имеет смысл.

###### Остальные детали

В папке Helpers находятся расширения к Color и UIColor, чтобы создавать цвет используя hex формат.
Также был создан ViewModifier с названием roundedCorners, необходимый для компактного скругления углов используя разный радиус.

В папке Resources есть файлы Images, Colors, Mocks.
В Images я создаю объекты UIImage, чтобы не указывать каждый раз название изображаения в Assets.
В Mocks я создаю массив с моковыми продуктами.

###### Результат работы
![Result](./ReadmeAssets/result.gif "Result")

