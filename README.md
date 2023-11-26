# TaskManagementApplication

Flutter の最適なアーキテクチャを考えるために作成しているタスク管理アプリ

## アーキテクチャ

基本的には MVVM を適用する

- infrastructure
  - DB や API などとの通信やローカルファイルからの読み込みや書き込みなど、データソースとのやり取りを行う
- model にビジネスロジックを実装
  - entity にオブジェクトの記述
  - repository に実装する処理の抽象クラスを定義する
  - repository_impl に repository の実装を記述、infrastructure の実装を使用するのはここで行う。
  - use_case に機能の抽象クラスを記述
  - use_case_impl に use_case の実装を行う。provider で扱えるように変換する処理や入力チェックなどを行う。
- provider に riverpod を使用して 所謂 ViewModel の実装
  - state に状態クラスを定義する。モデルの entity と共通する場合は流用しても良いが、将来的に分離する可能性があることを念頭に置く。
  - notifier に Notifier を継承したクラスを定義し、そこでは model/use_case に処理を委譲し、画面に表示するための情報を保持する。
- view に UI に関する Widget の実装
  - components は共通して仕様する部品などを記述
  - page に各画面の widget を記述
  - hooks を使用した状態管理はトグルボタンの状態、テキストフィールドの状態など UI に関することで画面のローカルな状態を管理するのに使用
  - ref.watch・read などを用いて provider/notifier を購買する

ファイル構成

- view/
  - theme/
  - components/
  - page/
- provider/
  - state/
    - navigation/
  - notifier/
    - navigation/
- model/
  - entity/
  - repository/
  - repository_impl/
  - use_case/
  - use_case_impl/
- infrastructure/

## 検索条件

- タスクの ID で 検索
- 自分に割り当てられているタスクの検索
- タスクグループで検索
- タスク ID から、それの子タスクを検索
- 子タスク追加・削除・編集
- タスク追加・削除・編集
- どの人がどのタスクに取り組んでいるか

## table

https://docs.aws.amazon.com/ja_jp/amazondynamodb/latest/developerguide/best-practices.html

| PartitionKey | SortKey                  | Manager          | Name        | Summary        | Description          | Deadline | State | Priority | GroupByManager |
| ------------ | ------------------------ | ---------------- | ----------- | -------------- | -------------------- | -------- | ----- | -------- | -------------- |
| ProjectID1   | Project#Detail           | sample user name | sample name | sample summary | This is description. | 20230711 |       |          |                |
| ProjectID1   | Project#Assignee#UserID1 |                  |             |                |                      |          |       |          |                |
| ProjectID1   | Project#Assignee#UserID2 |                  |             |                |                      |          |       |          |                |
| ProjectID1   | Task#TaskID              | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 0        | 1              |
| ProjectID1   | Task#TaskID#Child1       | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 0        | 1              |
| ProjectID1   | Task#TaskID1             | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 0        | 1              |
| ProjectID1   | Task#TaskID1#Child1      | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 0        | 1              |
| ProjectID1   | Task#TaskID2             | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 1        | 1              |
| ProjectID1   | Task#TaskID2#Child1      | sample user name | task name   | summary        | detail description.  | 20230711 | Done  | 1        | 1              |
| ProjectID1   | Task#TaskID2#Child2      | sample user name | task name   | summary        | detail description.  | 20230711 | Doing | 1        | 1              |
