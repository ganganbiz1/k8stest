# k8stest

## dockerimage 作成

```
$ docker build -t k8stest/gosample:v1 .
```

## deploy 実行

```
kubectl apply -f deployment.yml
```

## deploy 削除

```
kubectl delete -f deployment.yml
```

## service 実行

```
kubectl apply -f service.yml
```

## service 削除

```
kubectl delete -f service.yml
```

## deploy 表示

```
kubectl get deployments
```

## pod 表示

```
kubectl get pod
```

## pod で任意のコマンド実行

```
kubectl exec -it 【pod名】 -c 【コンテナ名】 -- コマンド
サンプル（bashだと便利）
```

```
kubectl exec -it k8stest-c5f54fcdf-ssgv9 -c k8stestapp -- /bin/bash
```
