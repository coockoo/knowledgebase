import torch


def sample01():
    # initialize a matrix 2x5
    x = torch.empty(2, 5)
    # underscore at then end means that this is an "in-place change".
    x.fill_(1.125)
    print(x.sum().item())


sample01()


def sample02():
    x = torch.tensor([1.0, 2.0])
    y = torch.tensor([3.0, 4.0])
    res = torch.dot(x, y)
    print(res.item())


sample02()


def sample03():
    available_gpus = [torch.cuda.device(i)
                      for i in range(torch.cuda.device_count())]
    print(available_gpus)
    return


sample03()
