from abc import ABC
from pydantic import BaseModel

from aws_lambda_python.common_domain.check_parameters import CaaCheckParameters, DcvCheckParameters


class BaseCheckRequest(BaseModel, ABC):
    domain_or_ip_target: str


class CaaCheckRequest(BaseCheckRequest):
    caa_check_parameters: CaaCheckParameters | None = None


class DcvCheckRequest(BaseCheckRequest):
    dcv_check_parameters: DcvCheckParameters
